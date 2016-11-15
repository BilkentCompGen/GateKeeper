// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
// Date        : Tue Jun 21 04:37:54 2016
// Host        : jalapeno running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub {/home/hhassan/git/GateKeeper/FPGA
//               Application/VC709_Gen3x4If128/GateKeeper.srcs/sources_1/ip/clk_gen/clk_gen_stub.v}
// Design      : clk_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen(clk_in1, clk_out1, reset)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,reset" */;
  input clk_in1;
  output clk_out1;
  input reset;
endmodule
