-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.3 (lin64) Build 1034051 Fri Oct  3 16:31:15 MDT 2014
-- Date        : Sun Oct 25 15:46:29 2015
-- Host        : arthas-ubuntu running 64-bit Ubuntu 14.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/arthas/git/SHD/SHD.srcs/sources_1/ip/pcie3_7x_0/pcie3_7x_0_stub.vhdl
-- Design      : pcie3_7x_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pcie3_7x_0 is
  Port ( 
    pci_exp_txn : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pci_exp_txp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pci_exp_rxn : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pci_exp_rxp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    user_clk : out STD_LOGIC;
    user_reset : out STD_LOGIC;
    user_lnk_up : out STD_LOGIC;
    user_app_rdy : out STD_LOGIC;
    s_axis_rq_tlast : in STD_LOGIC;
    s_axis_rq_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_rq_tuser : in STD_LOGIC_VECTOR ( 59 downto 0 );
    s_axis_rq_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_rq_tready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_rq_tvalid : in STD_LOGIC;
    m_axis_rc_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_rc_tuser : out STD_LOGIC_VECTOR ( 74 downto 0 );
    m_axis_rc_tlast : out STD_LOGIC;
    m_axis_rc_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rc_tvalid : out STD_LOGIC;
    m_axis_rc_tready : in STD_LOGIC_VECTOR ( 21 downto 0 );
    m_axis_cq_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_cq_tuser : out STD_LOGIC_VECTOR ( 84 downto 0 );
    m_axis_cq_tlast : out STD_LOGIC;
    m_axis_cq_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_cq_tvalid : out STD_LOGIC;
    m_axis_cq_tready : in STD_LOGIC_VECTOR ( 21 downto 0 );
    s_axis_cc_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_cc_tuser : in STD_LOGIC_VECTOR ( 32 downto 0 );
    s_axis_cc_tlast : in STD_LOGIC;
    s_axis_cc_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_cc_tvalid : in STD_LOGIC;
    s_axis_cc_tready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pcie_rq_seq_num : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pcie_rq_seq_num_vld : out STD_LOGIC;
    pcie_rq_tag : out STD_LOGIC_VECTOR ( 5 downto 0 );
    pcie_rq_tag_vld : out STD_LOGIC;
    pcie_cq_np_req : in STD_LOGIC;
    pcie_cq_np_req_count : out STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_phy_link_down : out STD_LOGIC;
    cfg_phy_link_status : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_negotiated_width : out STD_LOGIC_VECTOR ( 3 downto 0 );
    cfg_current_speed : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_max_payload : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_max_read_req : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_function_status : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_function_power_state : out STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_vf_status : out STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_vf_power_state : out STD_LOGIC_VECTOR ( 17 downto 0 );
    cfg_link_power_state : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_err_cor_out : out STD_LOGIC;
    cfg_err_nonfatal_out : out STD_LOGIC;
    cfg_err_fatal_out : out STD_LOGIC;
    cfg_ltr_enable : out STD_LOGIC;
    cfg_ltssm_state : out STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_rcb_status : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_dpa_substate_change : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_obff_enable : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_pl_status_change : out STD_LOGIC;
    cfg_tph_requester_enable : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_tph_st_mode : out STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_vf_tph_requester_enable : out STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_vf_tph_st_mode : out STD_LOGIC_VECTOR ( 17 downto 0 );
    cfg_fc_ph : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_fc_pd : out STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_fc_nph : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_fc_npd : out STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_fc_cplh : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_fc_cpld : out STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_fc_sel : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_interrupt_int : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cfg_interrupt_pending : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_interrupt_sent : out STD_LOGIC;
    cfg_interrupt_msi_enable : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_interrupt_msi_vf_enable : out STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_interrupt_msi_mmenable : out STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_interrupt_msi_mask_update : out STD_LOGIC;
    cfg_interrupt_msi_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_interrupt_msi_select : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cfg_interrupt_msi_int : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_interrupt_msi_pending_status : in STD_LOGIC_VECTOR ( 63 downto 0 );
    cfg_interrupt_msi_sent : out STD_LOGIC;
    cfg_interrupt_msi_fail : out STD_LOGIC;
    cfg_interrupt_msi_attr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_interrupt_msi_tph_present : in STD_LOGIC;
    cfg_interrupt_msi_tph_type : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_interrupt_msi_tph_st_tag : in STD_LOGIC_VECTOR ( 8 downto 0 );
    cfg_interrupt_msi_function_number : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sys_clk : in STD_LOGIC;
    sys_reset : in STD_LOGIC
  );

end pcie3_7x_0;

architecture stub of pcie3_7x_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "pci_exp_txn[3:0],pci_exp_txp[3:0],pci_exp_rxn[3:0],pci_exp_rxp[3:0],user_clk,user_reset,user_lnk_up,user_app_rdy,s_axis_rq_tlast,s_axis_rq_tdata[127:0],s_axis_rq_tuser[59:0],s_axis_rq_tkeep[3:0],s_axis_rq_tready[3:0],s_axis_rq_tvalid,m_axis_rc_tdata[127:0],m_axis_rc_tuser[74:0],m_axis_rc_tlast,m_axis_rc_tkeep[3:0],m_axis_rc_tvalid,m_axis_rc_tready[21:0],m_axis_cq_tdata[127:0],m_axis_cq_tuser[84:0],m_axis_cq_tlast,m_axis_cq_tkeep[3:0],m_axis_cq_tvalid,m_axis_cq_tready[21:0],s_axis_cc_tdata[127:0],s_axis_cc_tuser[32:0],s_axis_cc_tlast,s_axis_cc_tkeep[3:0],s_axis_cc_tvalid,s_axis_cc_tready[3:0],pcie_rq_seq_num[3:0],pcie_rq_seq_num_vld,pcie_rq_tag[5:0],pcie_rq_tag_vld,pcie_cq_np_req,pcie_cq_np_req_count[5:0],cfg_phy_link_down,cfg_phy_link_status[1:0],cfg_negotiated_width[3:0],cfg_current_speed[2:0],cfg_max_payload[2:0],cfg_max_read_req[2:0],cfg_function_status[7:0],cfg_function_power_state[5:0],cfg_vf_status[11:0],cfg_vf_power_state[17:0],cfg_link_power_state[1:0],cfg_err_cor_out,cfg_err_nonfatal_out,cfg_err_fatal_out,cfg_ltr_enable,cfg_ltssm_state[5:0],cfg_rcb_status[1:0],cfg_dpa_substate_change[1:0],cfg_obff_enable[1:0],cfg_pl_status_change,cfg_tph_requester_enable[1:0],cfg_tph_st_mode[5:0],cfg_vf_tph_requester_enable[5:0],cfg_vf_tph_st_mode[17:0],cfg_fc_ph[7:0],cfg_fc_pd[11:0],cfg_fc_nph[7:0],cfg_fc_npd[11:0],cfg_fc_cplh[7:0],cfg_fc_cpld[11:0],cfg_fc_sel[2:0],cfg_interrupt_int[3:0],cfg_interrupt_pending[1:0],cfg_interrupt_sent,cfg_interrupt_msi_enable[1:0],cfg_interrupt_msi_vf_enable[5:0],cfg_interrupt_msi_mmenable[5:0],cfg_interrupt_msi_mask_update,cfg_interrupt_msi_data[31:0],cfg_interrupt_msi_select[3:0],cfg_interrupt_msi_int[31:0],cfg_interrupt_msi_pending_status[63:0],cfg_interrupt_msi_sent,cfg_interrupt_msi_fail,cfg_interrupt_msi_attr[2:0],cfg_interrupt_msi_tph_present,cfg_interrupt_msi_tph_type[1:0],cfg_interrupt_msi_tph_st_tag[8:0],cfg_interrupt_msi_function_number[2:0],sys_clk,sys_reset";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "pcie3_7x_0_pcie_3_0_7vx,Vivado 2014.3";
begin
end;
