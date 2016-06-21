-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
-- Date        : Tue Jun 21 04:38:38 2016
-- Host        : jalapeno running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub {/home/hhassan/git/GateKeeper/FPGA
--               Application/VC709_Gen3x4If128/GateKeeper.srcs/sources_1/ip/pcie_recv_fifo/pcie_recv_fifo_stub.vhdl}
-- Design      : pcie_recv_fifo
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcie_recv_fifo is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 255 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 255 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end pcie_recv_fifo;

architecture stub of pcie_recv_fifo is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,srst,din[255:0],wr_en,rd_en,dout[255:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_0_1,Vivado 2015.4";
begin
end;
