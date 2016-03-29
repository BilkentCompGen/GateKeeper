// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3 (lin64) Build 1034051 Fri Oct  3 16:31:15 MDT 2014
// Date        : Sun Oct 25 15:42:23 2015
// Host        : arthas-ubuntu running 64-bit Ubuntu 14.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/arthas/git/SHD/SHD.srcs/sources_1/ip/pcie_recv_fifo/pcie_recv_fifo_stub.v
// Design      : pcie_recv_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v12_0,Vivado 2014.3" *)
module pcie_recv_fifo(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[255:0],wr_en,rd_en,dout[255:0],full,empty" */;
  input clk;
  input srst;
  input [255:0]din;
  input wr_en;
  input rd_en;
  output [255:0]dout;
  output full;
  output empty;
endmodule
