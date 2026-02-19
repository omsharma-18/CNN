#pragma once

#include "ap_int.h"
#include "hls_stream.h"
#include <stdint.h>

// ============================================================
// ARCHITECTURE CONSTANTS
// ============================================================
#define IMG_H       64
#define IMG_W       64

// Conv1: 1->8 filters, 3x3
#define CONV1_OUT_H  62
#define CONV1_OUT_W  62
#define CONV1_FILTERS 8
#define CONV1_W_SIZE  (CONV1_FILTERS * 1 * 9)   // 72
#define CONV1_B_SIZE  CONV1_FILTERS               // 8

// Pool1: 2x2 -> 31x31x8
#define POOL1_H  31
#define POOL1_W  31

// Conv2: 8->16 filters, 3x3
#define CONV2_OUT_H  29
#define CONV2_OUT_W  29
#define CONV2_FILTERS 16
#define CONV2_IN_CH   8
#define CONV2_W_SIZE  (CONV2_FILTERS * CONV2_IN_CH * 9) // 1152
#define CONV2_B_SIZE  CONV2_FILTERS                       // 16

// Pool2: 2x2 -> 14x14x16
#define POOL2_H  14
#define POOL2_W  14

// Conv3: 16->32 filters, 3x3
#define CONV3_OUT_H  12
#define CONV3_OUT_W  12
#define CONV3_FILTERS 32
#define CONV3_IN_CH   16
#define CONV3_W_SIZE  (CONV3_FILTERS * CONV3_IN_CH * 9) // 4608
#define CONV3_B_SIZE  CONV3_FILTERS                       // 32

// Pool3: 2x2 -> 6x6x32
#define POOL3_H  6
#define POOL3_W  6

// FC: 6*6*32=1152 -> 64
#define FC_IN   1152
#define FC_OUT  64
#define FC_W_SIZE  (FC_OUT * FC_IN)  // 73728
#define FC_B_SIZE  FC_OUT            // 64

// Output layer: 64 -> 2
#define OUT_W_SIZE  (2 * FC_OUT)  // 128
#define OUT_B_SIZE  2             // 2

#define NUM_CLASSES  2

// Scale factor for fixed-point arithmetic (right shift)
#define SCALE_SHIFT  3

// ============================================================
// TOP-LEVEL FUNCTION DECLARATION
// ============================================================
void real_detector(
    ap_uint<8>  *image,        // Input image [64*64]
    ap_int<8>   *conv1_w,      // Conv1 weights [72]
    ap_int<8>   *conv1_b,      // Conv1 biases  [8]
    ap_int<8>   *conv2_w,      // Conv2 weights [1152]
    ap_int<8>   *conv2_b,      // Conv2 biases  [16]
    ap_int<8>   *conv3_w,      // Conv3 weights [4608]
    ap_int<8>   *conv3_b,      // Conv3 biases  [32]
    ap_int<8>   *fc_w,         // FC weights    [73728]
    ap_int<8>   *fc_b,         // FC biases     [64]
    ap_int<8>   *out_w,        // Output weights[128]
    ap_int<8>   *out_b,        // Output biases [2]
    volatile int *result        // Output: [class, cx, cy, w, h, conf, sc0, sc1, magic]
);
