//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Thu Feb 19 10:30:30 2026
//Host        : TMP215-54 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;

  wire Net;
  wire [31:0]S00_AXI_1_ARADDR;
  wire [1:0]S00_AXI_1_ARBURST;
  wire [3:0]S00_AXI_1_ARCACHE;
  wire [11:0]S00_AXI_1_ARID;
  wire [3:0]S00_AXI_1_ARLEN;
  wire [1:0]S00_AXI_1_ARLOCK;
  wire [2:0]S00_AXI_1_ARPROT;
  wire [3:0]S00_AXI_1_ARQOS;
  wire S00_AXI_1_ARREADY;
  wire [2:0]S00_AXI_1_ARSIZE;
  wire S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_AWADDR;
  wire [1:0]S00_AXI_1_AWBURST;
  wire [3:0]S00_AXI_1_AWCACHE;
  wire [11:0]S00_AXI_1_AWID;
  wire [3:0]S00_AXI_1_AWLEN;
  wire [1:0]S00_AXI_1_AWLOCK;
  wire [2:0]S00_AXI_1_AWPROT;
  wire [3:0]S00_AXI_1_AWQOS;
  wire S00_AXI_1_AWREADY;
  wire [2:0]S00_AXI_1_AWSIZE;
  wire S00_AXI_1_AWVALID;
  wire [11:0]S00_AXI_1_BID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire [11:0]S00_AXI_1_RID;
  wire S00_AXI_1_RLAST;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire [11:0]S00_AXI_1_WID;
  wire S00_AXI_1_WLAST;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire S00_AXI_1_WVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_ARADDR;
  wire axi_interconnect_0_M00_AXI_ARREADY;
  wire axi_interconnect_0_M00_AXI_ARVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_AWADDR;
  wire axi_interconnect_0_M00_AXI_AWREADY;
  wire axi_interconnect_0_M00_AXI_AWVALID;
  wire axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_BRESP;
  wire axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_RDATA;
  wire axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_RRESP;
  wire axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_WDATA;
  wire axi_interconnect_0_M00_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M00_AXI_WSTRB;
  wire axi_interconnect_0_M00_AXI_WVALID;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [63:0]real_detector_0_m_axi_gmem_c1b_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_c1b_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_c1b_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_c1b_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_c1b_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_c1b_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_c1b_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_c1b_ARQOS;
  wire real_detector_0_m_axi_gmem_c1b_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_c1b_ARSIZE;
  wire real_detector_0_m_axi_gmem_c1b_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_c1b_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_c1b_RID;
  wire real_detector_0_m_axi_gmem_c1b_RLAST;
  wire real_detector_0_m_axi_gmem_c1b_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_c1b_RRESP;
  wire real_detector_0_m_axi_gmem_c1b_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_c1w_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_c1w_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_c1w_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_c1w_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_c1w_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_c1w_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_c1w_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_c1w_ARQOS;
  wire real_detector_0_m_axi_gmem_c1w_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_c1w_ARSIZE;
  wire real_detector_0_m_axi_gmem_c1w_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_c1w_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_c1w_RID;
  wire real_detector_0_m_axi_gmem_c1w_RLAST;
  wire real_detector_0_m_axi_gmem_c1w_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_c1w_RRESP;
  wire real_detector_0_m_axi_gmem_c1w_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_c2b_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_c2b_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_c2b_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_c2b_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_c2b_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_c2b_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_c2b_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_c2b_ARQOS;
  wire real_detector_0_m_axi_gmem_c2b_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_c2b_ARSIZE;
  wire real_detector_0_m_axi_gmem_c2b_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_c2b_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_c2b_RID;
  wire real_detector_0_m_axi_gmem_c2b_RLAST;
  wire real_detector_0_m_axi_gmem_c2b_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_c2b_RRESP;
  wire real_detector_0_m_axi_gmem_c2b_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_c2w_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_c2w_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_c2w_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_c2w_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_c2w_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_c2w_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_c2w_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_c2w_ARQOS;
  wire real_detector_0_m_axi_gmem_c2w_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_c2w_ARSIZE;
  wire real_detector_0_m_axi_gmem_c2w_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_c2w_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_c2w_RID;
  wire real_detector_0_m_axi_gmem_c2w_RLAST;
  wire real_detector_0_m_axi_gmem_c2w_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_c2w_RRESP;
  wire real_detector_0_m_axi_gmem_c2w_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_c3b_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_c3b_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_c3b_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_c3b_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_c3b_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_c3b_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_c3b_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_c3b_ARQOS;
  wire real_detector_0_m_axi_gmem_c3b_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_c3b_ARSIZE;
  wire real_detector_0_m_axi_gmem_c3b_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_c3b_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_c3b_RID;
  wire real_detector_0_m_axi_gmem_c3b_RLAST;
  wire real_detector_0_m_axi_gmem_c3b_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_c3b_RRESP;
  wire real_detector_0_m_axi_gmem_c3b_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_c3w_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_c3w_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_c3w_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_c3w_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_c3w_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_c3w_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_c3w_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_c3w_ARQOS;
  wire real_detector_0_m_axi_gmem_c3w_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_c3w_ARSIZE;
  wire real_detector_0_m_axi_gmem_c3w_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_c3w_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_c3w_RID;
  wire real_detector_0_m_axi_gmem_c3w_RLAST;
  wire real_detector_0_m_axi_gmem_c3w_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_c3w_RRESP;
  wire real_detector_0_m_axi_gmem_c3w_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_fcb_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_fcb_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_fcb_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_fcb_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_fcb_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_fcb_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_fcb_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_fcb_ARQOS;
  wire real_detector_0_m_axi_gmem_fcb_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_fcb_ARSIZE;
  wire real_detector_0_m_axi_gmem_fcb_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_fcb_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_fcb_RID;
  wire real_detector_0_m_axi_gmem_fcb_RLAST;
  wire real_detector_0_m_axi_gmem_fcb_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_fcb_RRESP;
  wire real_detector_0_m_axi_gmem_fcb_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_fcw_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_fcw_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_fcw_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_fcw_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_fcw_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_fcw_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_fcw_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_fcw_ARQOS;
  wire real_detector_0_m_axi_gmem_fcw_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_fcw_ARSIZE;
  wire real_detector_0_m_axi_gmem_fcw_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_fcw_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_fcw_RID;
  wire real_detector_0_m_axi_gmem_fcw_RLAST;
  wire real_detector_0_m_axi_gmem_fcw_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_fcw_RRESP;
  wire real_detector_0_m_axi_gmem_fcw_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_img_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_img_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_img_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_img_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_img_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_img_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_img_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_img_ARQOS;
  wire real_detector_0_m_axi_gmem_img_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_img_ARSIZE;
  wire real_detector_0_m_axi_gmem_img_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_img_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_img_RID;
  wire real_detector_0_m_axi_gmem_img_RLAST;
  wire real_detector_0_m_axi_gmem_img_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_img_RRESP;
  wire real_detector_0_m_axi_gmem_img_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_outb_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_outb_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_outb_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_outb_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_outb_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_outb_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_outb_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_outb_ARQOS;
  wire real_detector_0_m_axi_gmem_outb_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_outb_ARSIZE;
  wire real_detector_0_m_axi_gmem_outb_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_outb_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_outb_RID;
  wire real_detector_0_m_axi_gmem_outb_RLAST;
  wire real_detector_0_m_axi_gmem_outb_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_outb_RRESP;
  wire real_detector_0_m_axi_gmem_outb_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_outw_ARADDR;
  wire [1:0]real_detector_0_m_axi_gmem_outw_ARBURST;
  wire [3:0]real_detector_0_m_axi_gmem_outw_ARCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_outw_ARID;
  wire [7:0]real_detector_0_m_axi_gmem_outw_ARLEN;
  wire [1:0]real_detector_0_m_axi_gmem_outw_ARLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_outw_ARPROT;
  wire [3:0]real_detector_0_m_axi_gmem_outw_ARQOS;
  wire real_detector_0_m_axi_gmem_outw_ARREADY;
  wire [2:0]real_detector_0_m_axi_gmem_outw_ARSIZE;
  wire real_detector_0_m_axi_gmem_outw_ARVALID;
  wire [31:0]real_detector_0_m_axi_gmem_outw_RDATA;
  wire [0:0]real_detector_0_m_axi_gmem_outw_RID;
  wire real_detector_0_m_axi_gmem_outw_RLAST;
  wire real_detector_0_m_axi_gmem_outw_RREADY;
  wire [1:0]real_detector_0_m_axi_gmem_outw_RRESP;
  wire real_detector_0_m_axi_gmem_outw_RVALID;
  wire [63:0]real_detector_0_m_axi_gmem_res_AWADDR;
  wire [1:0]real_detector_0_m_axi_gmem_res_AWBURST;
  wire [3:0]real_detector_0_m_axi_gmem_res_AWCACHE;
  wire [0:0]real_detector_0_m_axi_gmem_res_AWID;
  wire [7:0]real_detector_0_m_axi_gmem_res_AWLEN;
  wire [1:0]real_detector_0_m_axi_gmem_res_AWLOCK;
  wire [2:0]real_detector_0_m_axi_gmem_res_AWPROT;
  wire [3:0]real_detector_0_m_axi_gmem_res_AWQOS;
  wire real_detector_0_m_axi_gmem_res_AWREADY;
  wire [2:0]real_detector_0_m_axi_gmem_res_AWSIZE;
  wire real_detector_0_m_axi_gmem_res_AWVALID;
  wire [0:0]real_detector_0_m_axi_gmem_res_BID;
  wire real_detector_0_m_axi_gmem_res_BREADY;
  wire [1:0]real_detector_0_m_axi_gmem_res_BRESP;
  wire real_detector_0_m_axi_gmem_res_BVALID;
  wire [31:0]real_detector_0_m_axi_gmem_res_WDATA;
  wire real_detector_0_m_axi_gmem_res_WLAST;
  wire real_detector_0_m_axi_gmem_res_WREADY;
  wire [3:0]real_detector_0_m_axi_gmem_res_WSTRB;
  wire real_detector_0_m_axi_gmem_res_WVALID;
  wire [31:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_0_M00_AXI_ARLEN;
  wire [1:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire [3:0]smartconnect_0_M00_AXI_ARQOS;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [31:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_0_M00_AXI_AWLEN;
  wire [1:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire [3:0]smartconnect_0_M00_AXI_AWQOS;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [63:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [63:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [7:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [31:0]smartconnect_1_M00_AXI_ARADDR;
  wire [1:0]smartconnect_1_M00_AXI_ARBURST;
  wire [3:0]smartconnect_1_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_1_M00_AXI_ARLEN;
  wire [1:0]smartconnect_1_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_1_M00_AXI_ARPROT;
  wire [3:0]smartconnect_1_M00_AXI_ARQOS;
  wire smartconnect_1_M00_AXI_ARREADY;
  wire [2:0]smartconnect_1_M00_AXI_ARSIZE;
  wire smartconnect_1_M00_AXI_ARVALID;
  wire [63:0]smartconnect_1_M00_AXI_RDATA;
  wire smartconnect_1_M00_AXI_RLAST;
  wire smartconnect_1_M00_AXI_RREADY;
  wire [1:0]smartconnect_1_M00_AXI_RRESP;
  wire smartconnect_1_M00_AXI_RVALID;
  wire [31:0]smartconnect_2_M00_AXI_ARADDR;
  wire [1:0]smartconnect_2_M00_AXI_ARBURST;
  wire [3:0]smartconnect_2_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_2_M00_AXI_ARLEN;
  wire [1:0]smartconnect_2_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_2_M00_AXI_ARPROT;
  wire [3:0]smartconnect_2_M00_AXI_ARQOS;
  wire smartconnect_2_M00_AXI_ARREADY;
  wire [2:0]smartconnect_2_M00_AXI_ARSIZE;
  wire smartconnect_2_M00_AXI_ARVALID;
  wire [63:0]smartconnect_2_M00_AXI_RDATA;
  wire smartconnect_2_M00_AXI_RLAST;
  wire smartconnect_2_M00_AXI_RREADY;
  wire [1:0]smartconnect_2_M00_AXI_RRESP;
  wire smartconnect_2_M00_AXI_RVALID;

  design_1_axi_interconnect_0_0 axi_interconnect_0
       (.ACLK(Net),
        .ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .M00_ACLK(Net),
        .M00_ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .M00_AXI_araddr(axi_interconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_interconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_interconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_interconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_interconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_interconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_interconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(axi_interconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_interconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_interconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_interconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(axi_interconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_interconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_0_M00_AXI_WVALID),
        .S00_ACLK(Net),
        .S00_ARESETN(proc_sys_reset_0_peripheral_aresetn),
        .S00_AXI_araddr(S00_AXI_1_ARADDR),
        .S00_AXI_arburst(S00_AXI_1_ARBURST),
        .S00_AXI_arcache(S00_AXI_1_ARCACHE),
        .S00_AXI_arid(S00_AXI_1_ARID),
        .S00_AXI_arlen(S00_AXI_1_ARLEN),
        .S00_AXI_arlock(S00_AXI_1_ARLOCK),
        .S00_AXI_arprot(S00_AXI_1_ARPROT),
        .S00_AXI_arqos(S00_AXI_1_ARQOS),
        .S00_AXI_arready(S00_AXI_1_ARREADY),
        .S00_AXI_arsize(S00_AXI_1_ARSIZE),
        .S00_AXI_arvalid(S00_AXI_1_ARVALID),
        .S00_AXI_awaddr(S00_AXI_1_AWADDR),
        .S00_AXI_awburst(S00_AXI_1_AWBURST),
        .S00_AXI_awcache(S00_AXI_1_AWCACHE),
        .S00_AXI_awid(S00_AXI_1_AWID),
        .S00_AXI_awlen(S00_AXI_1_AWLEN),
        .S00_AXI_awlock(S00_AXI_1_AWLOCK),
        .S00_AXI_awprot(S00_AXI_1_AWPROT),
        .S00_AXI_awqos(S00_AXI_1_AWQOS),
        .S00_AXI_awready(S00_AXI_1_AWREADY),
        .S00_AXI_awsize(S00_AXI_1_AWSIZE),
        .S00_AXI_awvalid(S00_AXI_1_AWVALID),
        .S00_AXI_bid(S00_AXI_1_BID),
        .S00_AXI_bready(S00_AXI_1_BREADY),
        .S00_AXI_bresp(S00_AXI_1_BRESP),
        .S00_AXI_bvalid(S00_AXI_1_BVALID),
        .S00_AXI_rdata(S00_AXI_1_RDATA),
        .S00_AXI_rid(S00_AXI_1_RID),
        .S00_AXI_rlast(S00_AXI_1_RLAST),
        .S00_AXI_rready(S00_AXI_1_RREADY),
        .S00_AXI_rresp(S00_AXI_1_RRESP),
        .S00_AXI_rvalid(S00_AXI_1_RVALID),
        .S00_AXI_wdata(S00_AXI_1_WDATA),
        .S00_AXI_wid(S00_AXI_1_WID),
        .S00_AXI_wlast(S00_AXI_1_WLAST),
        .S00_AXI_wready(S00_AXI_1_WREADY),
        .S00_AXI_wstrb(S00_AXI_1_WSTRB),
        .S00_AXI_wvalid(S00_AXI_1_WVALID));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(Net));
  design_1_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(Net),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(Net),
        .M_AXI_GP0_ARADDR(S00_AXI_1_ARADDR),
        .M_AXI_GP0_ARBURST(S00_AXI_1_ARBURST),
        .M_AXI_GP0_ARCACHE(S00_AXI_1_ARCACHE),
        .M_AXI_GP0_ARID(S00_AXI_1_ARID),
        .M_AXI_GP0_ARLEN(S00_AXI_1_ARLEN),
        .M_AXI_GP0_ARLOCK(S00_AXI_1_ARLOCK),
        .M_AXI_GP0_ARPROT(S00_AXI_1_ARPROT),
        .M_AXI_GP0_ARQOS(S00_AXI_1_ARQOS),
        .M_AXI_GP0_ARREADY(S00_AXI_1_ARREADY),
        .M_AXI_GP0_ARSIZE(S00_AXI_1_ARSIZE),
        .M_AXI_GP0_ARVALID(S00_AXI_1_ARVALID),
        .M_AXI_GP0_AWADDR(S00_AXI_1_AWADDR),
        .M_AXI_GP0_AWBURST(S00_AXI_1_AWBURST),
        .M_AXI_GP0_AWCACHE(S00_AXI_1_AWCACHE),
        .M_AXI_GP0_AWID(S00_AXI_1_AWID),
        .M_AXI_GP0_AWLEN(S00_AXI_1_AWLEN),
        .M_AXI_GP0_AWLOCK(S00_AXI_1_AWLOCK),
        .M_AXI_GP0_AWPROT(S00_AXI_1_AWPROT),
        .M_AXI_GP0_AWQOS(S00_AXI_1_AWQOS),
        .M_AXI_GP0_AWREADY(S00_AXI_1_AWREADY),
        .M_AXI_GP0_AWSIZE(S00_AXI_1_AWSIZE),
        .M_AXI_GP0_AWVALID(S00_AXI_1_AWVALID),
        .M_AXI_GP0_BID(S00_AXI_1_BID),
        .M_AXI_GP0_BREADY(S00_AXI_1_BREADY),
        .M_AXI_GP0_BRESP(S00_AXI_1_BRESP),
        .M_AXI_GP0_BVALID(S00_AXI_1_BVALID),
        .M_AXI_GP0_RDATA(S00_AXI_1_RDATA),
        .M_AXI_GP0_RID(S00_AXI_1_RID),
        .M_AXI_GP0_RLAST(S00_AXI_1_RLAST),
        .M_AXI_GP0_RREADY(S00_AXI_1_RREADY),
        .M_AXI_GP0_RRESP(S00_AXI_1_RRESP),
        .M_AXI_GP0_RVALID(S00_AXI_1_RVALID),
        .M_AXI_GP0_WDATA(S00_AXI_1_WDATA),
        .M_AXI_GP0_WID(S00_AXI_1_WID),
        .M_AXI_GP0_WLAST(S00_AXI_1_WLAST),
        .M_AXI_GP0_WREADY(S00_AXI_1_WREADY),
        .M_AXI_GP0_WSTRB(S00_AXI_1_WSTRB),
        .M_AXI_GP0_WVALID(S00_AXI_1_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(Net),
        .S_AXI_HP0_ARADDR(smartconnect_0_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(smartconnect_0_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(smartconnect_0_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN(smartconnect_0_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(smartconnect_0_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(smartconnect_0_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(smartconnect_0_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(smartconnect_0_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(smartconnect_0_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(smartconnect_0_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(smartconnect_0_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(smartconnect_0_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(smartconnect_0_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLEN(smartconnect_0_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(smartconnect_0_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(smartconnect_0_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(smartconnect_0_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(smartconnect_0_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(smartconnect_0_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(smartconnect_0_M00_AXI_AWVALID),
        .S_AXI_HP0_BREADY(smartconnect_0_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(smartconnect_0_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(smartconnect_0_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(smartconnect_0_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RLAST(smartconnect_0_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(smartconnect_0_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(smartconnect_0_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(smartconnect_0_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(smartconnect_0_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WLAST(smartconnect_0_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(smartconnect_0_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(smartconnect_0_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(smartconnect_0_M00_AXI_WVALID),
        .S_AXI_HP1_ACLK(Net),
        .S_AXI_HP1_ARADDR(smartconnect_1_M00_AXI_ARADDR),
        .S_AXI_HP1_ARBURST(smartconnect_1_M00_AXI_ARBURST),
        .S_AXI_HP1_ARCACHE(smartconnect_1_M00_AXI_ARCACHE),
        .S_AXI_HP1_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLEN(smartconnect_1_M00_AXI_ARLEN),
        .S_AXI_HP1_ARLOCK(smartconnect_1_M00_AXI_ARLOCK),
        .S_AXI_HP1_ARPROT(smartconnect_1_M00_AXI_ARPROT),
        .S_AXI_HP1_ARQOS(smartconnect_1_M00_AXI_ARQOS),
        .S_AXI_HP1_ARREADY(smartconnect_1_M00_AXI_ARREADY),
        .S_AXI_HP1_ARSIZE(smartconnect_1_M00_AXI_ARSIZE),
        .S_AXI_HP1_ARVALID(smartconnect_1_M00_AXI_ARVALID),
        .S_AXI_HP1_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWBURST({1'b0,1'b1}),
        .S_AXI_HP1_AWCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP1_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP1_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWSIZE({1'b0,1'b1,1'b1}),
        .S_AXI_HP1_AWVALID(1'b0),
        .S_AXI_HP1_BREADY(1'b0),
        .S_AXI_HP1_RDATA(smartconnect_1_M00_AXI_RDATA),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RLAST(smartconnect_1_M00_AXI_RLAST),
        .S_AXI_HP1_RREADY(smartconnect_1_M00_AXI_RREADY),
        .S_AXI_HP1_RRESP(smartconnect_1_M00_AXI_RRESP),
        .S_AXI_HP1_RVALID(smartconnect_1_M00_AXI_RVALID),
        .S_AXI_HP1_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WLAST(1'b0),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .S_AXI_HP1_WVALID(1'b0),
        .S_AXI_HP2_ACLK(Net),
        .S_AXI_HP2_ARADDR(smartconnect_2_M00_AXI_ARADDR),
        .S_AXI_HP2_ARBURST(smartconnect_2_M00_AXI_ARBURST),
        .S_AXI_HP2_ARCACHE(smartconnect_2_M00_AXI_ARCACHE),
        .S_AXI_HP2_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARLEN(smartconnect_2_M00_AXI_ARLEN),
        .S_AXI_HP2_ARLOCK(smartconnect_2_M00_AXI_ARLOCK),
        .S_AXI_HP2_ARPROT(smartconnect_2_M00_AXI_ARPROT),
        .S_AXI_HP2_ARQOS(smartconnect_2_M00_AXI_ARQOS),
        .S_AXI_HP2_ARREADY(smartconnect_2_M00_AXI_ARREADY),
        .S_AXI_HP2_ARSIZE(smartconnect_2_M00_AXI_ARSIZE),
        .S_AXI_HP2_ARVALID(smartconnect_2_M00_AXI_ARVALID),
        .S_AXI_HP2_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWBURST({1'b0,1'b1}),
        .S_AXI_HP2_AWCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP2_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP2_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWSIZE({1'b0,1'b1,1'b1}),
        .S_AXI_HP2_AWVALID(1'b0),
        .S_AXI_HP2_BREADY(1'b0),
        .S_AXI_HP2_RDATA(smartconnect_2_M00_AXI_RDATA),
        .S_AXI_HP2_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP2_RLAST(smartconnect_2_M00_AXI_RLAST),
        .S_AXI_HP2_RREADY(smartconnect_2_M00_AXI_RREADY),
        .S_AXI_HP2_RRESP(smartconnect_2_M00_AXI_RRESP),
        .S_AXI_HP2_RVALID(smartconnect_2_M00_AXI_RVALID),
        .S_AXI_HP2_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WLAST(1'b0),
        .S_AXI_HP2_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP2_WSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .S_AXI_HP2_WVALID(1'b0),
        .USB0_VBUS_PWRFAULT(1'b0));
  design_1_real_detector_0_0 real_detector_0
       (.ap_clk(Net),
        .ap_rst_n(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_gmem_c1b_ARADDR(real_detector_0_m_axi_gmem_c1b_ARADDR),
        .m_axi_gmem_c1b_ARBURST(real_detector_0_m_axi_gmem_c1b_ARBURST),
        .m_axi_gmem_c1b_ARCACHE(real_detector_0_m_axi_gmem_c1b_ARCACHE),
        .m_axi_gmem_c1b_ARID(real_detector_0_m_axi_gmem_c1b_ARID),
        .m_axi_gmem_c1b_ARLEN(real_detector_0_m_axi_gmem_c1b_ARLEN),
        .m_axi_gmem_c1b_ARLOCK(real_detector_0_m_axi_gmem_c1b_ARLOCK),
        .m_axi_gmem_c1b_ARPROT(real_detector_0_m_axi_gmem_c1b_ARPROT),
        .m_axi_gmem_c1b_ARQOS(real_detector_0_m_axi_gmem_c1b_ARQOS),
        .m_axi_gmem_c1b_ARREADY(real_detector_0_m_axi_gmem_c1b_ARREADY),
        .m_axi_gmem_c1b_ARSIZE(real_detector_0_m_axi_gmem_c1b_ARSIZE),
        .m_axi_gmem_c1b_ARVALID(real_detector_0_m_axi_gmem_c1b_ARVALID),
        .m_axi_gmem_c1b_AWREADY(1'b0),
        .m_axi_gmem_c1b_BID(1'b0),
        .m_axi_gmem_c1b_BRESP({1'b0,1'b0}),
        .m_axi_gmem_c1b_BVALID(1'b0),
        .m_axi_gmem_c1b_RDATA(real_detector_0_m_axi_gmem_c1b_RDATA),
        .m_axi_gmem_c1b_RID(real_detector_0_m_axi_gmem_c1b_RID),
        .m_axi_gmem_c1b_RLAST(real_detector_0_m_axi_gmem_c1b_RLAST),
        .m_axi_gmem_c1b_RREADY(real_detector_0_m_axi_gmem_c1b_RREADY),
        .m_axi_gmem_c1b_RRESP(real_detector_0_m_axi_gmem_c1b_RRESP),
        .m_axi_gmem_c1b_RVALID(real_detector_0_m_axi_gmem_c1b_RVALID),
        .m_axi_gmem_c1b_WREADY(1'b0),
        .m_axi_gmem_c1w_ARADDR(real_detector_0_m_axi_gmem_c1w_ARADDR),
        .m_axi_gmem_c1w_ARBURST(real_detector_0_m_axi_gmem_c1w_ARBURST),
        .m_axi_gmem_c1w_ARCACHE(real_detector_0_m_axi_gmem_c1w_ARCACHE),
        .m_axi_gmem_c1w_ARID(real_detector_0_m_axi_gmem_c1w_ARID),
        .m_axi_gmem_c1w_ARLEN(real_detector_0_m_axi_gmem_c1w_ARLEN),
        .m_axi_gmem_c1w_ARLOCK(real_detector_0_m_axi_gmem_c1w_ARLOCK),
        .m_axi_gmem_c1w_ARPROT(real_detector_0_m_axi_gmem_c1w_ARPROT),
        .m_axi_gmem_c1w_ARQOS(real_detector_0_m_axi_gmem_c1w_ARQOS),
        .m_axi_gmem_c1w_ARREADY(real_detector_0_m_axi_gmem_c1w_ARREADY),
        .m_axi_gmem_c1w_ARSIZE(real_detector_0_m_axi_gmem_c1w_ARSIZE),
        .m_axi_gmem_c1w_ARVALID(real_detector_0_m_axi_gmem_c1w_ARVALID),
        .m_axi_gmem_c1w_AWREADY(1'b0),
        .m_axi_gmem_c1w_BID(1'b0),
        .m_axi_gmem_c1w_BRESP({1'b0,1'b0}),
        .m_axi_gmem_c1w_BVALID(1'b0),
        .m_axi_gmem_c1w_RDATA(real_detector_0_m_axi_gmem_c1w_RDATA),
        .m_axi_gmem_c1w_RID(real_detector_0_m_axi_gmem_c1w_RID),
        .m_axi_gmem_c1w_RLAST(real_detector_0_m_axi_gmem_c1w_RLAST),
        .m_axi_gmem_c1w_RREADY(real_detector_0_m_axi_gmem_c1w_RREADY),
        .m_axi_gmem_c1w_RRESP(real_detector_0_m_axi_gmem_c1w_RRESP),
        .m_axi_gmem_c1w_RVALID(real_detector_0_m_axi_gmem_c1w_RVALID),
        .m_axi_gmem_c1w_WREADY(1'b0),
        .m_axi_gmem_c2b_ARADDR(real_detector_0_m_axi_gmem_c2b_ARADDR),
        .m_axi_gmem_c2b_ARBURST(real_detector_0_m_axi_gmem_c2b_ARBURST),
        .m_axi_gmem_c2b_ARCACHE(real_detector_0_m_axi_gmem_c2b_ARCACHE),
        .m_axi_gmem_c2b_ARID(real_detector_0_m_axi_gmem_c2b_ARID),
        .m_axi_gmem_c2b_ARLEN(real_detector_0_m_axi_gmem_c2b_ARLEN),
        .m_axi_gmem_c2b_ARLOCK(real_detector_0_m_axi_gmem_c2b_ARLOCK),
        .m_axi_gmem_c2b_ARPROT(real_detector_0_m_axi_gmem_c2b_ARPROT),
        .m_axi_gmem_c2b_ARQOS(real_detector_0_m_axi_gmem_c2b_ARQOS),
        .m_axi_gmem_c2b_ARREADY(real_detector_0_m_axi_gmem_c2b_ARREADY),
        .m_axi_gmem_c2b_ARSIZE(real_detector_0_m_axi_gmem_c2b_ARSIZE),
        .m_axi_gmem_c2b_ARVALID(real_detector_0_m_axi_gmem_c2b_ARVALID),
        .m_axi_gmem_c2b_AWREADY(1'b0),
        .m_axi_gmem_c2b_BID(1'b0),
        .m_axi_gmem_c2b_BRESP({1'b0,1'b0}),
        .m_axi_gmem_c2b_BVALID(1'b0),
        .m_axi_gmem_c2b_RDATA(real_detector_0_m_axi_gmem_c2b_RDATA),
        .m_axi_gmem_c2b_RID(real_detector_0_m_axi_gmem_c2b_RID),
        .m_axi_gmem_c2b_RLAST(real_detector_0_m_axi_gmem_c2b_RLAST),
        .m_axi_gmem_c2b_RREADY(real_detector_0_m_axi_gmem_c2b_RREADY),
        .m_axi_gmem_c2b_RRESP(real_detector_0_m_axi_gmem_c2b_RRESP),
        .m_axi_gmem_c2b_RVALID(real_detector_0_m_axi_gmem_c2b_RVALID),
        .m_axi_gmem_c2b_WREADY(1'b0),
        .m_axi_gmem_c2w_ARADDR(real_detector_0_m_axi_gmem_c2w_ARADDR),
        .m_axi_gmem_c2w_ARBURST(real_detector_0_m_axi_gmem_c2w_ARBURST),
        .m_axi_gmem_c2w_ARCACHE(real_detector_0_m_axi_gmem_c2w_ARCACHE),
        .m_axi_gmem_c2w_ARID(real_detector_0_m_axi_gmem_c2w_ARID),
        .m_axi_gmem_c2w_ARLEN(real_detector_0_m_axi_gmem_c2w_ARLEN),
        .m_axi_gmem_c2w_ARLOCK(real_detector_0_m_axi_gmem_c2w_ARLOCK),
        .m_axi_gmem_c2w_ARPROT(real_detector_0_m_axi_gmem_c2w_ARPROT),
        .m_axi_gmem_c2w_ARQOS(real_detector_0_m_axi_gmem_c2w_ARQOS),
        .m_axi_gmem_c2w_ARREADY(real_detector_0_m_axi_gmem_c2w_ARREADY),
        .m_axi_gmem_c2w_ARSIZE(real_detector_0_m_axi_gmem_c2w_ARSIZE),
        .m_axi_gmem_c2w_ARVALID(real_detector_0_m_axi_gmem_c2w_ARVALID),
        .m_axi_gmem_c2w_AWREADY(1'b0),
        .m_axi_gmem_c2w_BID(1'b0),
        .m_axi_gmem_c2w_BRESP({1'b0,1'b0}),
        .m_axi_gmem_c2w_BVALID(1'b0),
        .m_axi_gmem_c2w_RDATA(real_detector_0_m_axi_gmem_c2w_RDATA),
        .m_axi_gmem_c2w_RID(real_detector_0_m_axi_gmem_c2w_RID),
        .m_axi_gmem_c2w_RLAST(real_detector_0_m_axi_gmem_c2w_RLAST),
        .m_axi_gmem_c2w_RREADY(real_detector_0_m_axi_gmem_c2w_RREADY),
        .m_axi_gmem_c2w_RRESP(real_detector_0_m_axi_gmem_c2w_RRESP),
        .m_axi_gmem_c2w_RVALID(real_detector_0_m_axi_gmem_c2w_RVALID),
        .m_axi_gmem_c2w_WREADY(1'b0),
        .m_axi_gmem_c3b_ARADDR(real_detector_0_m_axi_gmem_c3b_ARADDR),
        .m_axi_gmem_c3b_ARBURST(real_detector_0_m_axi_gmem_c3b_ARBURST),
        .m_axi_gmem_c3b_ARCACHE(real_detector_0_m_axi_gmem_c3b_ARCACHE),
        .m_axi_gmem_c3b_ARID(real_detector_0_m_axi_gmem_c3b_ARID),
        .m_axi_gmem_c3b_ARLEN(real_detector_0_m_axi_gmem_c3b_ARLEN),
        .m_axi_gmem_c3b_ARLOCK(real_detector_0_m_axi_gmem_c3b_ARLOCK),
        .m_axi_gmem_c3b_ARPROT(real_detector_0_m_axi_gmem_c3b_ARPROT),
        .m_axi_gmem_c3b_ARQOS(real_detector_0_m_axi_gmem_c3b_ARQOS),
        .m_axi_gmem_c3b_ARREADY(real_detector_0_m_axi_gmem_c3b_ARREADY),
        .m_axi_gmem_c3b_ARSIZE(real_detector_0_m_axi_gmem_c3b_ARSIZE),
        .m_axi_gmem_c3b_ARVALID(real_detector_0_m_axi_gmem_c3b_ARVALID),
        .m_axi_gmem_c3b_AWREADY(1'b0),
        .m_axi_gmem_c3b_BID(1'b0),
        .m_axi_gmem_c3b_BRESP({1'b0,1'b0}),
        .m_axi_gmem_c3b_BVALID(1'b0),
        .m_axi_gmem_c3b_RDATA(real_detector_0_m_axi_gmem_c3b_RDATA),
        .m_axi_gmem_c3b_RID(real_detector_0_m_axi_gmem_c3b_RID),
        .m_axi_gmem_c3b_RLAST(real_detector_0_m_axi_gmem_c3b_RLAST),
        .m_axi_gmem_c3b_RREADY(real_detector_0_m_axi_gmem_c3b_RREADY),
        .m_axi_gmem_c3b_RRESP(real_detector_0_m_axi_gmem_c3b_RRESP),
        .m_axi_gmem_c3b_RVALID(real_detector_0_m_axi_gmem_c3b_RVALID),
        .m_axi_gmem_c3b_WREADY(1'b0),
        .m_axi_gmem_c3w_ARADDR(real_detector_0_m_axi_gmem_c3w_ARADDR),
        .m_axi_gmem_c3w_ARBURST(real_detector_0_m_axi_gmem_c3w_ARBURST),
        .m_axi_gmem_c3w_ARCACHE(real_detector_0_m_axi_gmem_c3w_ARCACHE),
        .m_axi_gmem_c3w_ARID(real_detector_0_m_axi_gmem_c3w_ARID),
        .m_axi_gmem_c3w_ARLEN(real_detector_0_m_axi_gmem_c3w_ARLEN),
        .m_axi_gmem_c3w_ARLOCK(real_detector_0_m_axi_gmem_c3w_ARLOCK),
        .m_axi_gmem_c3w_ARPROT(real_detector_0_m_axi_gmem_c3w_ARPROT),
        .m_axi_gmem_c3w_ARQOS(real_detector_0_m_axi_gmem_c3w_ARQOS),
        .m_axi_gmem_c3w_ARREADY(real_detector_0_m_axi_gmem_c3w_ARREADY),
        .m_axi_gmem_c3w_ARSIZE(real_detector_0_m_axi_gmem_c3w_ARSIZE),
        .m_axi_gmem_c3w_ARVALID(real_detector_0_m_axi_gmem_c3w_ARVALID),
        .m_axi_gmem_c3w_AWREADY(1'b0),
        .m_axi_gmem_c3w_BID(1'b0),
        .m_axi_gmem_c3w_BRESP({1'b0,1'b0}),
        .m_axi_gmem_c3w_BVALID(1'b0),
        .m_axi_gmem_c3w_RDATA(real_detector_0_m_axi_gmem_c3w_RDATA),
        .m_axi_gmem_c3w_RID(real_detector_0_m_axi_gmem_c3w_RID),
        .m_axi_gmem_c3w_RLAST(real_detector_0_m_axi_gmem_c3w_RLAST),
        .m_axi_gmem_c3w_RREADY(real_detector_0_m_axi_gmem_c3w_RREADY),
        .m_axi_gmem_c3w_RRESP(real_detector_0_m_axi_gmem_c3w_RRESP),
        .m_axi_gmem_c3w_RVALID(real_detector_0_m_axi_gmem_c3w_RVALID),
        .m_axi_gmem_c3w_WREADY(1'b0),
        .m_axi_gmem_fcb_ARADDR(real_detector_0_m_axi_gmem_fcb_ARADDR),
        .m_axi_gmem_fcb_ARBURST(real_detector_0_m_axi_gmem_fcb_ARBURST),
        .m_axi_gmem_fcb_ARCACHE(real_detector_0_m_axi_gmem_fcb_ARCACHE),
        .m_axi_gmem_fcb_ARID(real_detector_0_m_axi_gmem_fcb_ARID),
        .m_axi_gmem_fcb_ARLEN(real_detector_0_m_axi_gmem_fcb_ARLEN),
        .m_axi_gmem_fcb_ARLOCK(real_detector_0_m_axi_gmem_fcb_ARLOCK),
        .m_axi_gmem_fcb_ARPROT(real_detector_0_m_axi_gmem_fcb_ARPROT),
        .m_axi_gmem_fcb_ARQOS(real_detector_0_m_axi_gmem_fcb_ARQOS),
        .m_axi_gmem_fcb_ARREADY(real_detector_0_m_axi_gmem_fcb_ARREADY),
        .m_axi_gmem_fcb_ARSIZE(real_detector_0_m_axi_gmem_fcb_ARSIZE),
        .m_axi_gmem_fcb_ARVALID(real_detector_0_m_axi_gmem_fcb_ARVALID),
        .m_axi_gmem_fcb_AWREADY(1'b0),
        .m_axi_gmem_fcb_BID(1'b0),
        .m_axi_gmem_fcb_BRESP({1'b0,1'b0}),
        .m_axi_gmem_fcb_BVALID(1'b0),
        .m_axi_gmem_fcb_RDATA(real_detector_0_m_axi_gmem_fcb_RDATA),
        .m_axi_gmem_fcb_RID(real_detector_0_m_axi_gmem_fcb_RID),
        .m_axi_gmem_fcb_RLAST(real_detector_0_m_axi_gmem_fcb_RLAST),
        .m_axi_gmem_fcb_RREADY(real_detector_0_m_axi_gmem_fcb_RREADY),
        .m_axi_gmem_fcb_RRESP(real_detector_0_m_axi_gmem_fcb_RRESP),
        .m_axi_gmem_fcb_RVALID(real_detector_0_m_axi_gmem_fcb_RVALID),
        .m_axi_gmem_fcb_WREADY(1'b0),
        .m_axi_gmem_fcw_ARADDR(real_detector_0_m_axi_gmem_fcw_ARADDR),
        .m_axi_gmem_fcw_ARBURST(real_detector_0_m_axi_gmem_fcw_ARBURST),
        .m_axi_gmem_fcw_ARCACHE(real_detector_0_m_axi_gmem_fcw_ARCACHE),
        .m_axi_gmem_fcw_ARID(real_detector_0_m_axi_gmem_fcw_ARID),
        .m_axi_gmem_fcw_ARLEN(real_detector_0_m_axi_gmem_fcw_ARLEN),
        .m_axi_gmem_fcw_ARLOCK(real_detector_0_m_axi_gmem_fcw_ARLOCK),
        .m_axi_gmem_fcw_ARPROT(real_detector_0_m_axi_gmem_fcw_ARPROT),
        .m_axi_gmem_fcw_ARQOS(real_detector_0_m_axi_gmem_fcw_ARQOS),
        .m_axi_gmem_fcw_ARREADY(real_detector_0_m_axi_gmem_fcw_ARREADY),
        .m_axi_gmem_fcw_ARSIZE(real_detector_0_m_axi_gmem_fcw_ARSIZE),
        .m_axi_gmem_fcw_ARVALID(real_detector_0_m_axi_gmem_fcw_ARVALID),
        .m_axi_gmem_fcw_AWREADY(1'b0),
        .m_axi_gmem_fcw_BID(1'b0),
        .m_axi_gmem_fcw_BRESP({1'b0,1'b0}),
        .m_axi_gmem_fcw_BVALID(1'b0),
        .m_axi_gmem_fcw_RDATA(real_detector_0_m_axi_gmem_fcw_RDATA),
        .m_axi_gmem_fcw_RID(real_detector_0_m_axi_gmem_fcw_RID),
        .m_axi_gmem_fcw_RLAST(real_detector_0_m_axi_gmem_fcw_RLAST),
        .m_axi_gmem_fcw_RREADY(real_detector_0_m_axi_gmem_fcw_RREADY),
        .m_axi_gmem_fcw_RRESP(real_detector_0_m_axi_gmem_fcw_RRESP),
        .m_axi_gmem_fcw_RVALID(real_detector_0_m_axi_gmem_fcw_RVALID),
        .m_axi_gmem_fcw_WREADY(1'b0),
        .m_axi_gmem_img_ARADDR(real_detector_0_m_axi_gmem_img_ARADDR),
        .m_axi_gmem_img_ARBURST(real_detector_0_m_axi_gmem_img_ARBURST),
        .m_axi_gmem_img_ARCACHE(real_detector_0_m_axi_gmem_img_ARCACHE),
        .m_axi_gmem_img_ARID(real_detector_0_m_axi_gmem_img_ARID),
        .m_axi_gmem_img_ARLEN(real_detector_0_m_axi_gmem_img_ARLEN),
        .m_axi_gmem_img_ARLOCK(real_detector_0_m_axi_gmem_img_ARLOCK),
        .m_axi_gmem_img_ARPROT(real_detector_0_m_axi_gmem_img_ARPROT),
        .m_axi_gmem_img_ARQOS(real_detector_0_m_axi_gmem_img_ARQOS),
        .m_axi_gmem_img_ARREADY(real_detector_0_m_axi_gmem_img_ARREADY),
        .m_axi_gmem_img_ARSIZE(real_detector_0_m_axi_gmem_img_ARSIZE),
        .m_axi_gmem_img_ARVALID(real_detector_0_m_axi_gmem_img_ARVALID),
        .m_axi_gmem_img_AWREADY(1'b0),
        .m_axi_gmem_img_BID(1'b0),
        .m_axi_gmem_img_BRESP({1'b0,1'b0}),
        .m_axi_gmem_img_BVALID(1'b0),
        .m_axi_gmem_img_RDATA(real_detector_0_m_axi_gmem_img_RDATA),
        .m_axi_gmem_img_RID(real_detector_0_m_axi_gmem_img_RID),
        .m_axi_gmem_img_RLAST(real_detector_0_m_axi_gmem_img_RLAST),
        .m_axi_gmem_img_RREADY(real_detector_0_m_axi_gmem_img_RREADY),
        .m_axi_gmem_img_RRESP(real_detector_0_m_axi_gmem_img_RRESP),
        .m_axi_gmem_img_RVALID(real_detector_0_m_axi_gmem_img_RVALID),
        .m_axi_gmem_img_WREADY(1'b0),
        .m_axi_gmem_outb_ARADDR(real_detector_0_m_axi_gmem_outb_ARADDR),
        .m_axi_gmem_outb_ARBURST(real_detector_0_m_axi_gmem_outb_ARBURST),
        .m_axi_gmem_outb_ARCACHE(real_detector_0_m_axi_gmem_outb_ARCACHE),
        .m_axi_gmem_outb_ARID(real_detector_0_m_axi_gmem_outb_ARID),
        .m_axi_gmem_outb_ARLEN(real_detector_0_m_axi_gmem_outb_ARLEN),
        .m_axi_gmem_outb_ARLOCK(real_detector_0_m_axi_gmem_outb_ARLOCK),
        .m_axi_gmem_outb_ARPROT(real_detector_0_m_axi_gmem_outb_ARPROT),
        .m_axi_gmem_outb_ARQOS(real_detector_0_m_axi_gmem_outb_ARQOS),
        .m_axi_gmem_outb_ARREADY(real_detector_0_m_axi_gmem_outb_ARREADY),
        .m_axi_gmem_outb_ARSIZE(real_detector_0_m_axi_gmem_outb_ARSIZE),
        .m_axi_gmem_outb_ARVALID(real_detector_0_m_axi_gmem_outb_ARVALID),
        .m_axi_gmem_outb_AWREADY(1'b0),
        .m_axi_gmem_outb_BID(1'b0),
        .m_axi_gmem_outb_BRESP({1'b0,1'b0}),
        .m_axi_gmem_outb_BVALID(1'b0),
        .m_axi_gmem_outb_RDATA(real_detector_0_m_axi_gmem_outb_RDATA),
        .m_axi_gmem_outb_RID(real_detector_0_m_axi_gmem_outb_RID),
        .m_axi_gmem_outb_RLAST(real_detector_0_m_axi_gmem_outb_RLAST),
        .m_axi_gmem_outb_RREADY(real_detector_0_m_axi_gmem_outb_RREADY),
        .m_axi_gmem_outb_RRESP(real_detector_0_m_axi_gmem_outb_RRESP),
        .m_axi_gmem_outb_RVALID(real_detector_0_m_axi_gmem_outb_RVALID),
        .m_axi_gmem_outb_WREADY(1'b0),
        .m_axi_gmem_outw_ARADDR(real_detector_0_m_axi_gmem_outw_ARADDR),
        .m_axi_gmem_outw_ARBURST(real_detector_0_m_axi_gmem_outw_ARBURST),
        .m_axi_gmem_outw_ARCACHE(real_detector_0_m_axi_gmem_outw_ARCACHE),
        .m_axi_gmem_outw_ARID(real_detector_0_m_axi_gmem_outw_ARID),
        .m_axi_gmem_outw_ARLEN(real_detector_0_m_axi_gmem_outw_ARLEN),
        .m_axi_gmem_outw_ARLOCK(real_detector_0_m_axi_gmem_outw_ARLOCK),
        .m_axi_gmem_outw_ARPROT(real_detector_0_m_axi_gmem_outw_ARPROT),
        .m_axi_gmem_outw_ARQOS(real_detector_0_m_axi_gmem_outw_ARQOS),
        .m_axi_gmem_outw_ARREADY(real_detector_0_m_axi_gmem_outw_ARREADY),
        .m_axi_gmem_outw_ARSIZE(real_detector_0_m_axi_gmem_outw_ARSIZE),
        .m_axi_gmem_outw_ARVALID(real_detector_0_m_axi_gmem_outw_ARVALID),
        .m_axi_gmem_outw_AWREADY(1'b0),
        .m_axi_gmem_outw_BID(1'b0),
        .m_axi_gmem_outw_BRESP({1'b0,1'b0}),
        .m_axi_gmem_outw_BVALID(1'b0),
        .m_axi_gmem_outw_RDATA(real_detector_0_m_axi_gmem_outw_RDATA),
        .m_axi_gmem_outw_RID(real_detector_0_m_axi_gmem_outw_RID),
        .m_axi_gmem_outw_RLAST(real_detector_0_m_axi_gmem_outw_RLAST),
        .m_axi_gmem_outw_RREADY(real_detector_0_m_axi_gmem_outw_RREADY),
        .m_axi_gmem_outw_RRESP(real_detector_0_m_axi_gmem_outw_RRESP),
        .m_axi_gmem_outw_RVALID(real_detector_0_m_axi_gmem_outw_RVALID),
        .m_axi_gmem_outw_WREADY(1'b0),
        .m_axi_gmem_res_ARREADY(1'b0),
        .m_axi_gmem_res_AWADDR(real_detector_0_m_axi_gmem_res_AWADDR),
        .m_axi_gmem_res_AWBURST(real_detector_0_m_axi_gmem_res_AWBURST),
        .m_axi_gmem_res_AWCACHE(real_detector_0_m_axi_gmem_res_AWCACHE),
        .m_axi_gmem_res_AWID(real_detector_0_m_axi_gmem_res_AWID),
        .m_axi_gmem_res_AWLEN(real_detector_0_m_axi_gmem_res_AWLEN),
        .m_axi_gmem_res_AWLOCK(real_detector_0_m_axi_gmem_res_AWLOCK),
        .m_axi_gmem_res_AWPROT(real_detector_0_m_axi_gmem_res_AWPROT),
        .m_axi_gmem_res_AWQOS(real_detector_0_m_axi_gmem_res_AWQOS),
        .m_axi_gmem_res_AWREADY(real_detector_0_m_axi_gmem_res_AWREADY),
        .m_axi_gmem_res_AWSIZE(real_detector_0_m_axi_gmem_res_AWSIZE),
        .m_axi_gmem_res_AWVALID(real_detector_0_m_axi_gmem_res_AWVALID),
        .m_axi_gmem_res_BID(real_detector_0_m_axi_gmem_res_BID),
        .m_axi_gmem_res_BREADY(real_detector_0_m_axi_gmem_res_BREADY),
        .m_axi_gmem_res_BRESP(real_detector_0_m_axi_gmem_res_BRESP),
        .m_axi_gmem_res_BVALID(real_detector_0_m_axi_gmem_res_BVALID),
        .m_axi_gmem_res_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_gmem_res_RID(1'b0),
        .m_axi_gmem_res_RLAST(1'b0),
        .m_axi_gmem_res_RRESP({1'b0,1'b0}),
        .m_axi_gmem_res_RVALID(1'b0),
        .m_axi_gmem_res_WDATA(real_detector_0_m_axi_gmem_res_WDATA),
        .m_axi_gmem_res_WLAST(real_detector_0_m_axi_gmem_res_WLAST),
        .m_axi_gmem_res_WREADY(real_detector_0_m_axi_gmem_res_WREADY),
        .m_axi_gmem_res_WSTRB(real_detector_0_m_axi_gmem_res_WSTRB),
        .m_axi_gmem_res_WVALID(real_detector_0_m_axi_gmem_res_WVALID),
        .s_axi_control_ARADDR(axi_interconnect_0_M00_AXI_ARADDR[7:0]),
        .s_axi_control_ARREADY(axi_interconnect_0_M00_AXI_ARREADY),
        .s_axi_control_ARVALID(axi_interconnect_0_M00_AXI_ARVALID),
        .s_axi_control_AWADDR(axi_interconnect_0_M00_AXI_AWADDR[7:0]),
        .s_axi_control_AWREADY(axi_interconnect_0_M00_AXI_AWREADY),
        .s_axi_control_AWVALID(axi_interconnect_0_M00_AXI_AWVALID),
        .s_axi_control_BREADY(axi_interconnect_0_M00_AXI_BREADY),
        .s_axi_control_BRESP(axi_interconnect_0_M00_AXI_BRESP),
        .s_axi_control_BVALID(axi_interconnect_0_M00_AXI_BVALID),
        .s_axi_control_RDATA(axi_interconnect_0_M00_AXI_RDATA),
        .s_axi_control_RREADY(axi_interconnect_0_M00_AXI_RREADY),
        .s_axi_control_RRESP(axi_interconnect_0_M00_AXI_RRESP),
        .s_axi_control_RVALID(axi_interconnect_0_M00_AXI_RVALID),
        .s_axi_control_WDATA(axi_interconnect_0_M00_AXI_WDATA),
        .s_axi_control_WREADY(axi_interconnect_0_M00_AXI_WREADY),
        .s_axi_control_WSTRB(axi_interconnect_0_M00_AXI_WSTRB),
        .s_axi_control_WVALID(axi_interconnect_0_M00_AXI_WVALID));
  design_1_smartconnect_0_1 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_0_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_0_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(real_detector_0_m_axi_gmem_img_ARADDR),
        .S00_AXI_arburst(real_detector_0_m_axi_gmem_img_ARBURST),
        .S00_AXI_arcache(real_detector_0_m_axi_gmem_img_ARCACHE),
        .S00_AXI_arid(real_detector_0_m_axi_gmem_img_ARID),
        .S00_AXI_arlen(real_detector_0_m_axi_gmem_img_ARLEN),
        .S00_AXI_arlock(real_detector_0_m_axi_gmem_img_ARLOCK[0]),
        .S00_AXI_arprot(real_detector_0_m_axi_gmem_img_ARPROT),
        .S00_AXI_arqos(real_detector_0_m_axi_gmem_img_ARQOS),
        .S00_AXI_arready(real_detector_0_m_axi_gmem_img_ARREADY),
        .S00_AXI_arsize(real_detector_0_m_axi_gmem_img_ARSIZE),
        .S00_AXI_arvalid(real_detector_0_m_axi_gmem_img_ARVALID),
        .S00_AXI_rdata(real_detector_0_m_axi_gmem_img_RDATA),
        .S00_AXI_rid(real_detector_0_m_axi_gmem_img_RID),
        .S00_AXI_rlast(real_detector_0_m_axi_gmem_img_RLAST),
        .S00_AXI_rready(real_detector_0_m_axi_gmem_img_RREADY),
        .S00_AXI_rresp(real_detector_0_m_axi_gmem_img_RRESP),
        .S00_AXI_rvalid(real_detector_0_m_axi_gmem_img_RVALID),
        .S01_AXI_awaddr(real_detector_0_m_axi_gmem_res_AWADDR),
        .S01_AXI_awburst(real_detector_0_m_axi_gmem_res_AWBURST),
        .S01_AXI_awcache(real_detector_0_m_axi_gmem_res_AWCACHE),
        .S01_AXI_awid(real_detector_0_m_axi_gmem_res_AWID),
        .S01_AXI_awlen(real_detector_0_m_axi_gmem_res_AWLEN),
        .S01_AXI_awlock(real_detector_0_m_axi_gmem_res_AWLOCK[0]),
        .S01_AXI_awprot(real_detector_0_m_axi_gmem_res_AWPROT),
        .S01_AXI_awqos(real_detector_0_m_axi_gmem_res_AWQOS),
        .S01_AXI_awready(real_detector_0_m_axi_gmem_res_AWREADY),
        .S01_AXI_awsize(real_detector_0_m_axi_gmem_res_AWSIZE),
        .S01_AXI_awvalid(real_detector_0_m_axi_gmem_res_AWVALID),
        .S01_AXI_bid(real_detector_0_m_axi_gmem_res_BID),
        .S01_AXI_bready(real_detector_0_m_axi_gmem_res_BREADY),
        .S01_AXI_bresp(real_detector_0_m_axi_gmem_res_BRESP),
        .S01_AXI_bvalid(real_detector_0_m_axi_gmem_res_BVALID),
        .S01_AXI_wdata(real_detector_0_m_axi_gmem_res_WDATA),
        .S01_AXI_wlast(real_detector_0_m_axi_gmem_res_WLAST),
        .S01_AXI_wready(real_detector_0_m_axi_gmem_res_WREADY),
        .S01_AXI_wstrb(real_detector_0_m_axi_gmem_res_WSTRB),
        .S01_AXI_wvalid(real_detector_0_m_axi_gmem_res_WVALID),
        .aclk(Net),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  design_1_smartconnect_1_1 smartconnect_1
       (.M00_AXI_araddr(smartconnect_1_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_1_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_1_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_1_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_1_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_1_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_1_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_1_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_1_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_1_M00_AXI_ARVALID),
        .M00_AXI_rdata(smartconnect_1_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_1_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_1_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_1_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_1_M00_AXI_RVALID),
        .S00_AXI_araddr(real_detector_0_m_axi_gmem_c1w_ARADDR),
        .S00_AXI_arburst(real_detector_0_m_axi_gmem_c1w_ARBURST),
        .S00_AXI_arcache(real_detector_0_m_axi_gmem_c1w_ARCACHE),
        .S00_AXI_arid(real_detector_0_m_axi_gmem_c1w_ARID),
        .S00_AXI_arlen(real_detector_0_m_axi_gmem_c1w_ARLEN),
        .S00_AXI_arlock(real_detector_0_m_axi_gmem_c1w_ARLOCK[0]),
        .S00_AXI_arprot(real_detector_0_m_axi_gmem_c1w_ARPROT),
        .S00_AXI_arqos(real_detector_0_m_axi_gmem_c1w_ARQOS),
        .S00_AXI_arready(real_detector_0_m_axi_gmem_c1w_ARREADY),
        .S00_AXI_arsize(real_detector_0_m_axi_gmem_c1w_ARSIZE),
        .S00_AXI_arvalid(real_detector_0_m_axi_gmem_c1w_ARVALID),
        .S00_AXI_rdata(real_detector_0_m_axi_gmem_c1w_RDATA),
        .S00_AXI_rid(real_detector_0_m_axi_gmem_c1w_RID),
        .S00_AXI_rlast(real_detector_0_m_axi_gmem_c1w_RLAST),
        .S00_AXI_rready(real_detector_0_m_axi_gmem_c1w_RREADY),
        .S00_AXI_rresp(real_detector_0_m_axi_gmem_c1w_RRESP),
        .S00_AXI_rvalid(real_detector_0_m_axi_gmem_c1w_RVALID),
        .S01_AXI_araddr(real_detector_0_m_axi_gmem_c1b_ARADDR),
        .S01_AXI_arburst(real_detector_0_m_axi_gmem_c1b_ARBURST),
        .S01_AXI_arcache(real_detector_0_m_axi_gmem_c1b_ARCACHE),
        .S01_AXI_arid(real_detector_0_m_axi_gmem_c1b_ARID),
        .S01_AXI_arlen(real_detector_0_m_axi_gmem_c1b_ARLEN),
        .S01_AXI_arlock(real_detector_0_m_axi_gmem_c1b_ARLOCK[0]),
        .S01_AXI_arprot(real_detector_0_m_axi_gmem_c1b_ARPROT),
        .S01_AXI_arqos(real_detector_0_m_axi_gmem_c1b_ARQOS),
        .S01_AXI_arready(real_detector_0_m_axi_gmem_c1b_ARREADY),
        .S01_AXI_arsize(real_detector_0_m_axi_gmem_c1b_ARSIZE),
        .S01_AXI_arvalid(real_detector_0_m_axi_gmem_c1b_ARVALID),
        .S01_AXI_rdata(real_detector_0_m_axi_gmem_c1b_RDATA),
        .S01_AXI_rid(real_detector_0_m_axi_gmem_c1b_RID),
        .S01_AXI_rlast(real_detector_0_m_axi_gmem_c1b_RLAST),
        .S01_AXI_rready(real_detector_0_m_axi_gmem_c1b_RREADY),
        .S01_AXI_rresp(real_detector_0_m_axi_gmem_c1b_RRESP),
        .S01_AXI_rvalid(real_detector_0_m_axi_gmem_c1b_RVALID),
        .S02_AXI_araddr(real_detector_0_m_axi_gmem_c2w_ARADDR),
        .S02_AXI_arburst(real_detector_0_m_axi_gmem_c2w_ARBURST),
        .S02_AXI_arcache(real_detector_0_m_axi_gmem_c2w_ARCACHE),
        .S02_AXI_arid(real_detector_0_m_axi_gmem_c2w_ARID),
        .S02_AXI_arlen(real_detector_0_m_axi_gmem_c2w_ARLEN),
        .S02_AXI_arlock(real_detector_0_m_axi_gmem_c2w_ARLOCK[0]),
        .S02_AXI_arprot(real_detector_0_m_axi_gmem_c2w_ARPROT),
        .S02_AXI_arqos(real_detector_0_m_axi_gmem_c2w_ARQOS),
        .S02_AXI_arready(real_detector_0_m_axi_gmem_c2w_ARREADY),
        .S02_AXI_arsize(real_detector_0_m_axi_gmem_c2w_ARSIZE),
        .S02_AXI_arvalid(real_detector_0_m_axi_gmem_c2w_ARVALID),
        .S02_AXI_rdata(real_detector_0_m_axi_gmem_c2w_RDATA),
        .S02_AXI_rid(real_detector_0_m_axi_gmem_c2w_RID),
        .S02_AXI_rlast(real_detector_0_m_axi_gmem_c2w_RLAST),
        .S02_AXI_rready(real_detector_0_m_axi_gmem_c2w_RREADY),
        .S02_AXI_rresp(real_detector_0_m_axi_gmem_c2w_RRESP),
        .S02_AXI_rvalid(real_detector_0_m_axi_gmem_c2w_RVALID),
        .S03_AXI_araddr(real_detector_0_m_axi_gmem_c2b_ARADDR),
        .S03_AXI_arburst(real_detector_0_m_axi_gmem_c2b_ARBURST),
        .S03_AXI_arcache(real_detector_0_m_axi_gmem_c2b_ARCACHE),
        .S03_AXI_arid(real_detector_0_m_axi_gmem_c2b_ARID),
        .S03_AXI_arlen(real_detector_0_m_axi_gmem_c2b_ARLEN),
        .S03_AXI_arlock(real_detector_0_m_axi_gmem_c2b_ARLOCK[0]),
        .S03_AXI_arprot(real_detector_0_m_axi_gmem_c2b_ARPROT),
        .S03_AXI_arqos(real_detector_0_m_axi_gmem_c2b_ARQOS),
        .S03_AXI_arready(real_detector_0_m_axi_gmem_c2b_ARREADY),
        .S03_AXI_arsize(real_detector_0_m_axi_gmem_c2b_ARSIZE),
        .S03_AXI_arvalid(real_detector_0_m_axi_gmem_c2b_ARVALID),
        .S03_AXI_rdata(real_detector_0_m_axi_gmem_c2b_RDATA),
        .S03_AXI_rid(real_detector_0_m_axi_gmem_c2b_RID),
        .S03_AXI_rlast(real_detector_0_m_axi_gmem_c2b_RLAST),
        .S03_AXI_rready(real_detector_0_m_axi_gmem_c2b_RREADY),
        .S03_AXI_rresp(real_detector_0_m_axi_gmem_c2b_RRESP),
        .S03_AXI_rvalid(real_detector_0_m_axi_gmem_c2b_RVALID),
        .S04_AXI_araddr(real_detector_0_m_axi_gmem_c3w_ARADDR),
        .S04_AXI_arburst(real_detector_0_m_axi_gmem_c3w_ARBURST),
        .S04_AXI_arcache(real_detector_0_m_axi_gmem_c3w_ARCACHE),
        .S04_AXI_arid(real_detector_0_m_axi_gmem_c3w_ARID),
        .S04_AXI_arlen(real_detector_0_m_axi_gmem_c3w_ARLEN),
        .S04_AXI_arlock(real_detector_0_m_axi_gmem_c3w_ARLOCK[0]),
        .S04_AXI_arprot(real_detector_0_m_axi_gmem_c3w_ARPROT),
        .S04_AXI_arqos(real_detector_0_m_axi_gmem_c3w_ARQOS),
        .S04_AXI_arready(real_detector_0_m_axi_gmem_c3w_ARREADY),
        .S04_AXI_arsize(real_detector_0_m_axi_gmem_c3w_ARSIZE),
        .S04_AXI_arvalid(real_detector_0_m_axi_gmem_c3w_ARVALID),
        .S04_AXI_rdata(real_detector_0_m_axi_gmem_c3w_RDATA),
        .S04_AXI_rid(real_detector_0_m_axi_gmem_c3w_RID),
        .S04_AXI_rlast(real_detector_0_m_axi_gmem_c3w_RLAST),
        .S04_AXI_rready(real_detector_0_m_axi_gmem_c3w_RREADY),
        .S04_AXI_rresp(real_detector_0_m_axi_gmem_c3w_RRESP),
        .S04_AXI_rvalid(real_detector_0_m_axi_gmem_c3w_RVALID),
        .S05_AXI_araddr(real_detector_0_m_axi_gmem_c3b_ARADDR),
        .S05_AXI_arburst(real_detector_0_m_axi_gmem_c3b_ARBURST),
        .S05_AXI_arcache(real_detector_0_m_axi_gmem_c3b_ARCACHE),
        .S05_AXI_arid(real_detector_0_m_axi_gmem_c3b_ARID),
        .S05_AXI_arlen(real_detector_0_m_axi_gmem_c3b_ARLEN),
        .S05_AXI_arlock(real_detector_0_m_axi_gmem_c3b_ARLOCK[0]),
        .S05_AXI_arprot(real_detector_0_m_axi_gmem_c3b_ARPROT),
        .S05_AXI_arqos(real_detector_0_m_axi_gmem_c3b_ARQOS),
        .S05_AXI_arready(real_detector_0_m_axi_gmem_c3b_ARREADY),
        .S05_AXI_arsize(real_detector_0_m_axi_gmem_c3b_ARSIZE),
        .S05_AXI_arvalid(real_detector_0_m_axi_gmem_c3b_ARVALID),
        .S05_AXI_rdata(real_detector_0_m_axi_gmem_c3b_RDATA),
        .S05_AXI_rid(real_detector_0_m_axi_gmem_c3b_RID),
        .S05_AXI_rlast(real_detector_0_m_axi_gmem_c3b_RLAST),
        .S05_AXI_rready(real_detector_0_m_axi_gmem_c3b_RREADY),
        .S05_AXI_rresp(real_detector_0_m_axi_gmem_c3b_RRESP),
        .S05_AXI_rvalid(real_detector_0_m_axi_gmem_c3b_RVALID),
        .aclk(Net),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  design_1_smartconnect_2_1 smartconnect_2
       (.M00_AXI_araddr(smartconnect_2_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_2_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_2_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_2_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_2_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_2_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_2_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_2_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_2_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_2_M00_AXI_ARVALID),
        .M00_AXI_rdata(smartconnect_2_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_2_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_2_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_2_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_2_M00_AXI_RVALID),
        .S00_AXI_araddr(real_detector_0_m_axi_gmem_fcw_ARADDR),
        .S00_AXI_arburst(real_detector_0_m_axi_gmem_fcw_ARBURST),
        .S00_AXI_arcache(real_detector_0_m_axi_gmem_fcw_ARCACHE),
        .S00_AXI_arid(real_detector_0_m_axi_gmem_fcw_ARID),
        .S00_AXI_arlen(real_detector_0_m_axi_gmem_fcw_ARLEN),
        .S00_AXI_arlock(real_detector_0_m_axi_gmem_fcw_ARLOCK[0]),
        .S00_AXI_arprot(real_detector_0_m_axi_gmem_fcw_ARPROT),
        .S00_AXI_arqos(real_detector_0_m_axi_gmem_fcw_ARQOS),
        .S00_AXI_arready(real_detector_0_m_axi_gmem_fcw_ARREADY),
        .S00_AXI_arsize(real_detector_0_m_axi_gmem_fcw_ARSIZE),
        .S00_AXI_arvalid(real_detector_0_m_axi_gmem_fcw_ARVALID),
        .S00_AXI_rdata(real_detector_0_m_axi_gmem_fcw_RDATA),
        .S00_AXI_rid(real_detector_0_m_axi_gmem_fcw_RID),
        .S00_AXI_rlast(real_detector_0_m_axi_gmem_fcw_RLAST),
        .S00_AXI_rready(real_detector_0_m_axi_gmem_fcw_RREADY),
        .S00_AXI_rresp(real_detector_0_m_axi_gmem_fcw_RRESP),
        .S00_AXI_rvalid(real_detector_0_m_axi_gmem_fcw_RVALID),
        .S01_AXI_araddr(real_detector_0_m_axi_gmem_fcb_ARADDR),
        .S01_AXI_arburst(real_detector_0_m_axi_gmem_fcb_ARBURST),
        .S01_AXI_arcache(real_detector_0_m_axi_gmem_fcb_ARCACHE),
        .S01_AXI_arid(real_detector_0_m_axi_gmem_fcb_ARID),
        .S01_AXI_arlen(real_detector_0_m_axi_gmem_fcb_ARLEN),
        .S01_AXI_arlock(real_detector_0_m_axi_gmem_fcb_ARLOCK[0]),
        .S01_AXI_arprot(real_detector_0_m_axi_gmem_fcb_ARPROT),
        .S01_AXI_arqos(real_detector_0_m_axi_gmem_fcb_ARQOS),
        .S01_AXI_arready(real_detector_0_m_axi_gmem_fcb_ARREADY),
        .S01_AXI_arsize(real_detector_0_m_axi_gmem_fcb_ARSIZE),
        .S01_AXI_arvalid(real_detector_0_m_axi_gmem_fcb_ARVALID),
        .S01_AXI_rdata(real_detector_0_m_axi_gmem_fcb_RDATA),
        .S01_AXI_rid(real_detector_0_m_axi_gmem_fcb_RID),
        .S01_AXI_rlast(real_detector_0_m_axi_gmem_fcb_RLAST),
        .S01_AXI_rready(real_detector_0_m_axi_gmem_fcb_RREADY),
        .S01_AXI_rresp(real_detector_0_m_axi_gmem_fcb_RRESP),
        .S01_AXI_rvalid(real_detector_0_m_axi_gmem_fcb_RVALID),
        .S02_AXI_araddr(real_detector_0_m_axi_gmem_outw_ARADDR),
        .S02_AXI_arburst(real_detector_0_m_axi_gmem_outw_ARBURST),
        .S02_AXI_arcache(real_detector_0_m_axi_gmem_outw_ARCACHE),
        .S02_AXI_arid(real_detector_0_m_axi_gmem_outw_ARID),
        .S02_AXI_arlen(real_detector_0_m_axi_gmem_outw_ARLEN),
        .S02_AXI_arlock(real_detector_0_m_axi_gmem_outw_ARLOCK[0]),
        .S02_AXI_arprot(real_detector_0_m_axi_gmem_outw_ARPROT),
        .S02_AXI_arqos(real_detector_0_m_axi_gmem_outw_ARQOS),
        .S02_AXI_arready(real_detector_0_m_axi_gmem_outw_ARREADY),
        .S02_AXI_arsize(real_detector_0_m_axi_gmem_outw_ARSIZE),
        .S02_AXI_arvalid(real_detector_0_m_axi_gmem_outw_ARVALID),
        .S02_AXI_rdata(real_detector_0_m_axi_gmem_outw_RDATA),
        .S02_AXI_rid(real_detector_0_m_axi_gmem_outw_RID),
        .S02_AXI_rlast(real_detector_0_m_axi_gmem_outw_RLAST),
        .S02_AXI_rready(real_detector_0_m_axi_gmem_outw_RREADY),
        .S02_AXI_rresp(real_detector_0_m_axi_gmem_outw_RRESP),
        .S02_AXI_rvalid(real_detector_0_m_axi_gmem_outw_RVALID),
        .S03_AXI_araddr(real_detector_0_m_axi_gmem_outb_ARADDR),
        .S03_AXI_arburst(real_detector_0_m_axi_gmem_outb_ARBURST),
        .S03_AXI_arcache(real_detector_0_m_axi_gmem_outb_ARCACHE),
        .S03_AXI_arid(real_detector_0_m_axi_gmem_outb_ARID),
        .S03_AXI_arlen(real_detector_0_m_axi_gmem_outb_ARLEN),
        .S03_AXI_arlock(real_detector_0_m_axi_gmem_outb_ARLOCK[0]),
        .S03_AXI_arprot(real_detector_0_m_axi_gmem_outb_ARPROT),
        .S03_AXI_arqos(real_detector_0_m_axi_gmem_outb_ARQOS),
        .S03_AXI_arready(real_detector_0_m_axi_gmem_outb_ARREADY),
        .S03_AXI_arsize(real_detector_0_m_axi_gmem_outb_ARSIZE),
        .S03_AXI_arvalid(real_detector_0_m_axi_gmem_outb_ARVALID),
        .S03_AXI_rdata(real_detector_0_m_axi_gmem_outb_RDATA),
        .S03_AXI_rid(real_detector_0_m_axi_gmem_outb_RID),
        .S03_AXI_rlast(real_detector_0_m_axi_gmem_outb_RLAST),
        .S03_AXI_rready(real_detector_0_m_axi_gmem_outb_RREADY),
        .S03_AXI_rresp(real_detector_0_m_axi_gmem_outb_RRESP),
        .S03_AXI_rvalid(real_detector_0_m_axi_gmem_outb_RVALID),
        .aclk(Net),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
endmodule

module design_1_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_interconnect_0_ACLK_net;
  wire axi_interconnect_0_ARESETN_net;
  wire [31:0]axi_interconnect_0_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARCACHE;
  wire [11:0]axi_interconnect_0_to_s00_couplers_ARID;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARLEN;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARQOS;
  wire axi_interconnect_0_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARSIZE;
  wire axi_interconnect_0_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWCACHE;
  wire [11:0]axi_interconnect_0_to_s00_couplers_AWID;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWLEN;
  wire [1:0]axi_interconnect_0_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWQOS;
  wire axi_interconnect_0_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWSIZE;
  wire axi_interconnect_0_to_s00_couplers_AWVALID;
  wire [11:0]axi_interconnect_0_to_s00_couplers_BID;
  wire axi_interconnect_0_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_BRESP;
  wire axi_interconnect_0_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_RDATA;
  wire [11:0]axi_interconnect_0_to_s00_couplers_RID;
  wire axi_interconnect_0_to_s00_couplers_RLAST;
  wire axi_interconnect_0_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RRESP;
  wire axi_interconnect_0_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_WDATA;
  wire [11:0]axi_interconnect_0_to_s00_couplers_WID;
  wire axi_interconnect_0_to_s00_couplers_WLAST;
  wire axi_interconnect_0_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_0_to_s00_couplers_WSTRB;
  wire axi_interconnect_0_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_0_ARADDR;
  wire s00_couplers_to_axi_interconnect_0_ARREADY;
  wire s00_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_0_AWADDR;
  wire s00_couplers_to_axi_interconnect_0_AWREADY;
  wire s00_couplers_to_axi_interconnect_0_AWVALID;
  wire s00_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_0_BRESP;
  wire s00_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_0_RDATA;
  wire s00_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_0_RRESP;
  wire s00_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_0_WDATA;
  wire s00_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]s00_couplers_to_axi_interconnect_0_WSTRB;
  wire s00_couplers_to_axi_interconnect_0_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_axi_interconnect_0_ARADDR;
  assign M00_AXI_arvalid = s00_couplers_to_axi_interconnect_0_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_axi_interconnect_0_AWADDR;
  assign M00_AXI_awvalid = s00_couplers_to_axi_interconnect_0_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_interconnect_0_BREADY;
  assign M00_AXI_rready = s00_couplers_to_axi_interconnect_0_RREADY;
  assign M00_AXI_wdata[31:0] = s00_couplers_to_axi_interconnect_0_WDATA;
  assign M00_AXI_wstrb[3:0] = s00_couplers_to_axi_interconnect_0_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_interconnect_0_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_interconnect_0_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_0_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = axi_interconnect_0_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_0_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_0_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_0_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = axi_interconnect_0_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_0_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_0_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_0_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_0_to_s00_couplers_WREADY;
  assign axi_interconnect_0_ACLK_net = M00_ACLK;
  assign axi_interconnect_0_ARESETN_net = M00_ARESETN;
  assign axi_interconnect_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign axi_interconnect_0_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_0_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign axi_interconnect_0_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign axi_interconnect_0_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_0_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_0_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_0_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_0_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign axi_interconnect_0_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_0_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_0_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_axi_interconnect_0_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_interconnect_0_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_interconnect_0_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_interconnect_0_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_interconnect_0_RDATA = M00_AXI_rdata[31:0];
  assign s00_couplers_to_axi_interconnect_0_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_interconnect_0_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_axi_interconnect_0_WREADY = M00_AXI_wready;
  s00_couplers_imp_O7FAN0 s00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arready(s00_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awready(s00_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(s00_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(s00_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(s00_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(s00_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(s00_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_interconnect_0_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_0_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_0_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_0_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_0_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_0_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_0_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_0_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_0_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_0_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_0_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_0_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_0_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_0_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_0_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_0_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_0_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_0_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_0_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_0_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_0_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_0_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_0_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_0_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_0_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_0_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_0_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_0_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s00_couplers_WDATA),
        .S_AXI_wid(axi_interconnect_0_to_s00_couplers_WID),
        .S_AXI_wlast(axi_interconnect_0_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_0_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_0_to_s00_couplers_WVALID));
endmodule

module s00_couplers_imp_O7FAN0
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  design_1_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule
