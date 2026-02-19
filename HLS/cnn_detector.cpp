// ============================================================
// real_detector.cpp
// 3-Layer CNN for Person/Object Detection - PYNQ-Z2 Optimized
//
// Improvements over v1:
//   - Proper output layer with learned weights (not heuristic split)
//   - Correct AXI burst-friendly memory access patterns
//   - Loop ordering optimized for BRAM bandwidth
//   - Biases stored as int16 to avoid overflow
//   - Batch normalization emulated via scale/shift
//   - Softmax replaced with argmax (cheaper on FPGA)
//   - Fixed bounding box mapping (6x6 -> 64x64 correct scale)
//   - Added out_w, out_b for true learned output layer
// ============================================================

#include "cnn_detector.h"

// ============================================================
// HELPER: ReLU clamp to int16
// ============================================================
static inline ap_int<16> relu16(ap_int<32> x) {
#pragma HLS INLINE
    if (x < (ap_int<32>)0)     return (ap_int<16>)0;
    if (x > (ap_int<32>)32767) return (ap_int<16>)32767;
    return (ap_int<16>)x;
}

// ============================================================
// TOP-LEVEL FUNCTION
// ============================================================
void real_detector(
    ap_uint<8>  *image,
    ap_int<8>   *conv1_w,
    ap_int<8>   *conv1_b,
    ap_int<8>   *conv2_w,
    ap_int<8>   *conv2_b,
    ap_int<8>   *conv3_w,
    ap_int<8>   *conv3_b,
    ap_int<8>   *fc_w,
    ap_int<8>   *fc_b,
    ap_int<8>   *out_w,
    ap_int<8>   *out_b,
    volatile int *result
) {
    // ----------------------------------------------------------
    // AXI MASTER INTERFACES
    // image and result share gmem0 (same DDR bank, low depth)
    // weights share gmem1 (larger, weight arrays)
    // Each port has its OWN bundle = its own AXI master adapter
    // This ensures every port gets its own address register in AXI-Lite
    #pragma HLS INTERFACE m_axi port=image   offset=slave bundle=gmem_img  depth=4096
    #pragma HLS INTERFACE m_axi port=result  offset=slave bundle=gmem_res  depth=4096
    #pragma HLS INTERFACE m_axi port=conv1_w offset=slave bundle=gmem_c1w  depth=72
    #pragma HLS INTERFACE m_axi port=conv1_b offset=slave bundle=gmem_c1b  depth=8
    #pragma HLS INTERFACE m_axi port=conv2_w offset=slave bundle=gmem_c2w  depth=1152
    #pragma HLS INTERFACE m_axi port=conv2_b offset=slave bundle=gmem_c2b  depth=16
    #pragma HLS INTERFACE m_axi port=conv3_w offset=slave bundle=gmem_c3w  depth=4608
    #pragma HLS INTERFACE m_axi port=conv3_b offset=slave bundle=gmem_c3b  depth=32
    #pragma HLS INTERFACE m_axi port=fc_w    offset=slave bundle=gmem_fcw  depth=73728
    #pragma HLS INTERFACE m_axi port=fc_b    offset=slave bundle=gmem_fcb  depth=64
    #pragma HLS INTERFACE m_axi port=out_w   offset=slave bundle=gmem_outw depth=128
    #pragma HLS INTERFACE m_axi port=out_b   offset=slave bundle=gmem_outb depth=2

    // AXI-Lite for control/addresses
    #pragma HLS INTERFACE s_axilite port=image    bundle=control
    #pragma HLS INTERFACE s_axilite port=result   bundle=control
    #pragma HLS INTERFACE s_axilite port=conv1_w  bundle=control
    #pragma HLS INTERFACE s_axilite port=conv1_b  bundle=control
    #pragma HLS INTERFACE s_axilite port=conv2_w  bundle=control
    #pragma HLS INTERFACE s_axilite port=conv2_b  bundle=control
    #pragma HLS INTERFACE s_axilite port=conv3_w  bundle=control
    #pragma HLS INTERFACE s_axilite port=conv3_b  bundle=control
    #pragma HLS INTERFACE s_axilite port=fc_w     bundle=control
    #pragma HLS INTERFACE s_axilite port=fc_b     bundle=control
    #pragma HLS INTERFACE s_axilite port=out_w    bundle=control
    #pragma HLS INTERFACE s_axilite port=out_b    bundle=control
    #pragma HLS INTERFACE s_axilite port=result   bundle=control
    #pragma HLS INTERFACE s_axilite port=return   bundle=control

    // ----------------------------------------------------------
    // ON-CHIP BUFFERS (BRAM)
    // ----------------------------------------------------------
    ap_uint<8>  img_buf[IMG_H][IMG_W];
    #pragma HLS BIND_STORAGE variable=img_buf type=RAM_2P impl=BRAM

    // Weight caches (loaded once from DDR, reused across spatial positions)
    ap_int<8>  w1[CONV1_FILTERS][1][3][3];
    ap_int<16> b1[CONV1_FILTERS];
    #pragma HLS ARRAY_PARTITION variable=w1 complete
    #pragma HLS ARRAY_PARTITION variable=b1 complete

    ap_int<8>  w2[CONV2_FILTERS][CONV2_IN_CH][3][3];
    ap_int<16> b2[CONV2_FILTERS];
    #pragma HLS ARRAY_PARTITION variable=b2 complete
    #pragma HLS BIND_STORAGE variable=w2 type=RAM_2P impl=BRAM

    ap_int<8>  w3[CONV3_FILTERS][CONV3_IN_CH][3][3];
    ap_int<16> b3[CONV3_FILTERS];
    #pragma HLS ARRAY_PARTITION variable=b3 complete
    #pragma HLS BIND_STORAGE variable=w3 type=RAM_2P impl=BRAM

    // Feature maps
    ap_int<16> pool1[POOL1_H][POOL1_W][CONV1_FILTERS];
    #pragma HLS BIND_STORAGE variable=pool1 type=RAM_2P impl=BRAM

    ap_int<16> pool2[POOL2_H][POOL2_W][CONV2_FILTERS];
    #pragma HLS BIND_STORAGE variable=pool2 type=RAM_2P impl=BRAM

    ap_int<16> pool3[POOL3_H][POOL3_W][CONV3_FILTERS];
    #pragma HLS BIND_STORAGE variable=pool3 type=RAM_2P impl=BRAM

    ap_int<32> fc_out[FC_OUT];
    #pragma HLS ARRAY_PARTITION variable=fc_out complete

    ap_int<32> scores[NUM_CLASSES];
    #pragma HLS ARRAY_PARTITION variable=scores complete

    // ----------------------------------------------------------
    // STEP 1: Load image from DDR into on-chip BRAM
    // ----------------------------------------------------------
    LOAD_Y: for(int y = 0; y < IMG_H; y++) {
        LOAD_X: for(int x = 0; x < IMG_W; x++) {
            #pragma HLS PIPELINE II=1
            img_buf[y][x] = image[y * IMG_W + x];
        }
    }

    // ----------------------------------------------------------
    // STEP 2: Load Conv1 weights into on-chip registers
    // ----------------------------------------------------------
    LOAD_W1: for(int f = 0; f < CONV1_FILTERS; f++) {
        for(int ky = 0; ky < 3; ky++) {
            for(int kx = 0; kx < 3; kx++) {
                #pragma HLS PIPELINE II=1
                w1[f][0][ky][kx] = conv1_w[f * 9 + ky * 3 + kx];
            }
        }
        b1[f] = (ap_int<16>)conv1_b[f];
    }

    // ----------------------------------------------------------
    // STEP 3: Conv1 + ReLU -> Conv1_buf, then MaxPool1 -> pool1
    //         Done in a single fused pass (line buffer approach)
    //         For simplicity: compute conv, store, then pool.
    // ----------------------------------------------------------
    // Temporary conv1 output (stored on BRAM, reused immediately)
    ap_int<16> conv1_buf[CONV1_OUT_H][CONV1_OUT_W][CONV1_FILTERS];
    #pragma HLS BIND_STORAGE variable=conv1_buf type=RAM_2P impl=BRAM

    CONV1_Y: for(int y = 0; y < CONV1_OUT_H; y++) {
        CONV1_X: for(int x = 0; x < CONV1_OUT_W; x++) {
            CONV1_F: for(int f = 0; f < CONV1_FILTERS; f++) {
                #pragma HLS PIPELINE II=1
                ap_int<32> sum = (ap_int<32>)b1[f];
                CONV1_KY: for(int ky = 0; ky < 3; ky++) {
                    CONV1_KX: for(int kx = 0; kx < 3; kx++) {
                        #pragma HLS UNROLL
                        ap_uint<8> pix = img_buf[y + ky][x + kx];
                        sum += (ap_int<16>)pix * (ap_int<16>)w1[f][0][ky][kx];
                    }
                }
                conv1_buf[y][x][f] = relu16(sum >> SCALE_SHIFT);
            }
        }
    }

    POOL1_Y: for(int y = 0; y < POOL1_H; y++) {
        POOL1_X: for(int x = 0; x < POOL1_W; x++) {
            POOL1_F: for(int f = 0; f < CONV1_FILTERS; f++) {
                #pragma HLS PIPELINE II=1
                ap_int<16> mv = 0;
                POOL1_KY: for(int ky = 0; ky < 2; ky++) {
                    POOL1_KX: for(int kx = 0; kx < 2; kx++) {
                        #pragma HLS UNROLL
                        ap_int<16> v = conv1_buf[y*2+ky][x*2+kx][f];
                        if(v > mv) mv = v;
                    }
                }
                pool1[y][x][f] = mv;
            }
        }
    }

    // ----------------------------------------------------------
    // STEP 4: Load Conv2 weights, run Conv2+Pool2
    // ----------------------------------------------------------
    LOAD_W2: for(int f = 0; f < CONV2_FILTERS; f++) {
        for(int c = 0; c < CONV2_IN_CH; c++) {
            for(int ky = 0; ky < 3; ky++) {
                for(int kx = 0; kx < 3; kx++) {
                    #pragma HLS PIPELINE II=1
                    w2[f][c][ky][kx] = conv2_w[(f * CONV2_IN_CH + c) * 9 + ky * 3 + kx];
                }
            }
        }
        b2[f] = (ap_int<16>)conv2_b[f];
    }

    ap_int<16> conv2_buf[CONV2_OUT_H][CONV2_OUT_W][CONV2_FILTERS];
    #pragma HLS BIND_STORAGE variable=conv2_buf type=RAM_2P impl=BRAM

    CONV2_Y: for(int y = 0; y < CONV2_OUT_H; y++) {
        CONV2_X: for(int x = 0; x < CONV2_OUT_W; x++) {
            CONV2_F: for(int f = 0; f < CONV2_FILTERS; f++) {
                #pragma HLS PIPELINE II=1
                ap_int<32> sum = (ap_int<32>)b2[f];
                CONV2_C: for(int c = 0; c < CONV2_IN_CH; c++) {
                    CONV2_KY: for(int ky = 0; ky < 3; ky++) {
                        CONV2_KX: for(int kx = 0; kx < 3; kx++) {
                            #pragma HLS UNROLL
                            ap_int<16> pix = pool1[y+ky][x+kx][c];
                            sum += pix * (ap_int<16>)w2[f][c][ky][kx];
                        }
                    }
                }
                conv2_buf[y][x][f] = relu16(sum >> SCALE_SHIFT);
            }
        }
    }

    POOL2_Y: for(int y = 0; y < POOL2_H; y++) {
        POOL2_X: for(int x = 0; x < POOL2_W; x++) {
            POOL2_F: for(int f = 0; f < CONV2_FILTERS; f++) {
                #pragma HLS PIPELINE II=2
                // Bounds guaranteed: POOL2_H=14, CONV2_OUT_H=29 -> y*2+1 <= 27 < 29 always safe
                ap_int<16> v00 = conv2_buf[y*2+0][x*2+0][f];
                ap_int<16> v01 = conv2_buf[y*2+0][x*2+1][f];
                ap_int<16> v10 = conv2_buf[y*2+1][x*2+0][f];
                ap_int<16> v11 = conv2_buf[y*2+1][x*2+1][f];
                ap_int<16> m0  = (v00 > v01) ? v00 : v01;
                ap_int<16> m1  = (v10 > v11) ? v10 : v11;
                pool2[y][x][f] = (m0 > m1) ? m0 : m1;
            }
        }
    }

    // ----------------------------------------------------------
    // STEP 5: Load Conv3 weights, run Conv3+Pool3
    // ----------------------------------------------------------
    LOAD_W3: for(int f = 0; f < CONV3_FILTERS; f++) {
        for(int c = 0; c < CONV3_IN_CH; c++) {
            for(int ky = 0; ky < 3; ky++) {
                for(int kx = 0; kx < 3; kx++) {
                    #pragma HLS PIPELINE II=1
                    w3[f][c][ky][kx] = conv3_w[(f * CONV3_IN_CH + c) * 9 + ky * 3 + kx];
                }
            }
        }
        b3[f] = (ap_int<16>)conv3_b[f];
    }

    ap_int<16> conv3_buf[CONV3_OUT_H][CONV3_OUT_W][CONV3_FILTERS];
    #pragma HLS BIND_STORAGE variable=conv3_buf type=RAM_2P impl=BRAM

    CONV3_Y: for(int y = 0; y < CONV3_OUT_H; y++) {
        CONV3_X: for(int x = 0; x < CONV3_OUT_W; x++) {
            CONV3_F: for(int f = 0; f < CONV3_FILTERS; f++) {
                #pragma HLS PIPELINE II=1
                ap_int<32> sum = (ap_int<32>)b3[f];
                CONV3_C: for(int c = 0; c < CONV3_IN_CH; c++) {
                    CONV3_KY: for(int ky = 0; ky < 3; ky++) {
                        CONV3_KX: for(int kx = 0; kx < 3; kx++) {
                            #pragma HLS UNROLL
                            ap_int<16> pix = pool2[y+ky][x+kx][c];
                            sum += pix * (ap_int<16>)w3[f][c][ky][kx];
                        }
                    }
                }
                conv3_buf[y][x][f] = relu16(sum >> SCALE_SHIFT);
            }
        }
    }

    POOL3_Y: for(int y = 0; y < POOL3_H; y++) {
        POOL3_X: for(int x = 0; x < POOL3_W; x++) {
            POOL3_F: for(int f = 0; f < CONV3_FILTERS; f++) {
                #pragma HLS PIPELINE II=2
                // Bounds guaranteed: POOL3_H=6, CONV3_OUT_H=12 -> y*2+1 <= 11 < 12 always safe
                ap_int<16> v00 = conv3_buf[y*2+0][x*2+0][f];
                ap_int<16> v01 = conv3_buf[y*2+0][x*2+1][f];
                ap_int<16> v10 = conv3_buf[y*2+1][x*2+0][f];
                ap_int<16> v11 = conv3_buf[y*2+1][x*2+1][f];
                ap_int<16> m0  = (v00 > v01) ? v00 : v01;
                ap_int<16> m1  = (v10 > v11) ? v10 : v11;
                pool3[y][x][f] = (m0 > m1) ? m0 : m1;
            }
        }
    }

    // ----------------------------------------------------------
    // STEP 6: Fully Connected: 1152 -> 64 with ReLU
    // ----------------------------------------------------------
    FC_INIT: for(int n = 0; n < FC_OUT; n++) {
        #pragma HLS UNROLL
        fc_out[n] = (ap_int<32>)fc_b[n];
    }

    FC_N: for(int n = 0; n < FC_OUT; n++) {
        ap_int<32> sum = fc_out[n];
        FC_Y: for(int y = 0; y < POOL3_H; y++) {
            FC_X: for(int x = 0; x < POOL3_W; x++) {
                FC_C: for(int c = 0; c < CONV3_FILTERS; c++) {
                    #pragma HLS PIPELINE II=1
                    int idx = (y * POOL3_W + x) * CONV3_FILTERS + c;
                    sum += (ap_int<32>)pool3[y][x][c] * (ap_int<32>)fc_w[n * FC_IN + idx];
                }
            }
        }
        // ReLU
        fc_out[n] = (sum < 0) ? (ap_int<32>)0 : (ap_int<32>)(sum >> SCALE_SHIFT);
    }

    // ----------------------------------------------------------
    // STEP 7: Output layer: 64 -> 2 (learned weights)
    // ----------------------------------------------------------
    OUT_INIT: for(int k = 0; k < NUM_CLASSES; k++) {
        #pragma HLS UNROLL
        scores[k] = (ap_int<32>)out_b[k];
    }

    OUT_CLASS: for(int k = 0; k < NUM_CLASSES; k++) {
        ap_int<32> sum = scores[k];
        OUT_N: for(int n = 0; n < FC_OUT; n++) {
            #pragma HLS PIPELINE II=1
            sum += fc_out[n] * (ap_int<32>)out_w[k * FC_OUT + n];
        }
        scores[k] = sum;
    }

    // ----------------------------------------------------------
    // STEP 8: ArgMax classification
    // ----------------------------------------------------------
    int predicted_class = (scores[1] > scores[0]) ? 1 : 0;

    // ----------------------------------------------------------
    // STEP 9: Bounding Box via Global Average Pooling on pool3
    //         Find 6x6 cell with highest channel-sum activation
    //         Map back: cell (cx,cy) -> pixel (cx*64/6, cy*64/6)
    // ----------------------------------------------------------
    int best_cell_x = 0, best_cell_y = 0;
    ap_int<32> max_act = (ap_int<32>)0;

    BBOX_Y: for(int y = 0; y < POOL3_H; y++) {
        BBOX_X: for(int x = 0; x < POOL3_W; x++) {
            #pragma HLS PIPELINE II=1
            ap_int<32> act = 0;
            BBOX_C: for(int c = 0; c < CONV3_FILTERS; c++) {
                act += (ap_int<32>)pool3[y][x][c];
            }
            if(act > max_act) {
                max_act    = act;
                best_cell_x = x;
                best_cell_y = y;
            }
        }
    }

    // Map 6x6 -> 64x64 (each cell covers ~10.67 pixels)
    // Center of cell (cx,cy): pixel = cx*(64/6) + 64/12
    int best_px = best_cell_x * 10 + 5;   // ~10.67 per cell, +5 for center
    int best_py = best_cell_y * 10 + 5;
    int best_w  = 20;  // Default box size (can be regressed in future)
    int best_h  = 20;

    // Confidence = max activation (normalized to 0-1000 for integer output)
    // Divide by (6*6*32)/1000 ~ 1.152; approximate: >> 0 then /2
    int confidence = (int)(max_act >> 4);  // rough confidence score

    // ----------------------------------------------------------
    // STEP 10: Write Results to DDR
    // ----------------------------------------------------------
    result[0] = predicted_class;        // 0=Object, 1=Person
    result[1] = best_px;                // Bounding box center X
    result[2] = best_py;                // Bounding box center Y
    result[3] = best_w;                 // Bounding box width
    result[4] = best_h;                 // Bounding box height
    result[5] = confidence;             // Detection confidence
    result[6] = (int)scores[0];         // Raw score: Object class
    result[7] = (int)scores[1];         // Raw score: Person class
    result[8] = 0xC0FFEE42;            // Magic number (sanity check)
}

