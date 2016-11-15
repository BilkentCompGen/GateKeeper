// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
// Date        : Tue Jun 21 04:38:22 2016
// Host        : jalapeno running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub {/home/hhassan/git/GateKeeper/FPGA
//               Application/VC709_Gen3x4If128/GateKeeper.srcs/sources_1/ip/pcie3_7x_0/pcie3_7x_0_stub.v}
// Design      : pcie3_7x_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pcie3_7x_0_pcie_3_0_7vx,Vivado 2015.4" *)
module pcie3_7x_0(pci_exp_txn, pci_exp_txp, pci_exp_rxn, pci_exp_rxp, user_clk, user_reset, user_lnk_up, user_app_rdy, s_axis_rq_tlast, s_axis_rq_tdata, s_axis_rq_tuser, s_axis_rq_tkeep, s_axis_rq_tready, s_axis_rq_tvalid, m_axis_rc_tdata, m_axis_rc_tuser, m_axis_rc_tlast, m_axis_rc_tkeep, m_axis_rc_tvalid, m_axis_rc_tready, m_axis_cq_tdata, m_axis_cq_tuser, m_axis_cq_tlast, m_axis_cq_tkeep, m_axis_cq_tvalid, m_axis_cq_tready, s_axis_cc_tdata, s_axis_cc_tuser, s_axis_cc_tlast, s_axis_cc_tkeep, s_axis_cc_tvalid, s_axis_cc_tready, pcie_rq_seq_num, pcie_rq_seq_num_vld, pcie_rq_tag, pcie_rq_tag_vld, pcie_cq_np_req, pcie_cq_np_req_count, cfg_phy_link_down, cfg_phy_link_status, cfg_negotiated_width, cfg_current_speed, cfg_max_payload, cfg_max_read_req, cfg_function_status, cfg_function_power_state, cfg_vf_status, cfg_vf_power_state, cfg_link_power_state, cfg_err_cor_out, cfg_err_nonfatal_out, cfg_err_fatal_out, cfg_ltr_enable, cfg_ltssm_state, cfg_rcb_status, cfg_dpa_substate_change, cfg_obff_enable, cfg_pl_status_change, cfg_tph_requester_enable, cfg_tph_st_mode, cfg_vf_tph_requester_enable, cfg_vf_tph_st_mode, cfg_fc_ph, cfg_fc_pd, cfg_fc_nph, cfg_fc_npd, cfg_fc_cplh, cfg_fc_cpld, cfg_fc_sel, cfg_interrupt_int, cfg_interrupt_pending, cfg_interrupt_sent, cfg_interrupt_msi_enable, cfg_interrupt_msi_vf_enable, cfg_interrupt_msi_mmenable, cfg_interrupt_msi_mask_update, cfg_interrupt_msi_data, cfg_interrupt_msi_select, cfg_interrupt_msi_int, cfg_interrupt_msi_pending_status, cfg_interrupt_msi_sent, cfg_interrupt_msi_fail, cfg_interrupt_msi_attr, cfg_interrupt_msi_tph_present, cfg_interrupt_msi_tph_type, cfg_interrupt_msi_tph_st_tag, cfg_interrupt_msi_function_number, sys_clk, sys_reset)
/* synthesis syn_black_box black_box_pad_pin="pci_exp_txn[3:0],pci_exp_txp[3:0],pci_exp_rxn[3:0],pci_exp_rxp[3:0],user_clk,user_reset,user_lnk_up,user_app_rdy,s_axis_rq_tlast,s_axis_rq_tdata[127:0],s_axis_rq_tuser[59:0],s_axis_rq_tkeep[3:0],s_axis_rq_tready[3:0],s_axis_rq_tvalid,m_axis_rc_tdata[127:0],m_axis_rc_tuser[74:0],m_axis_rc_tlast,m_axis_rc_tkeep[3:0],m_axis_rc_tvalid,m_axis_rc_tready,m_axis_cq_tdata[127:0],m_axis_cq_tuser[84:0],m_axis_cq_tlast,m_axis_cq_tkeep[3:0],m_axis_cq_tvalid,m_axis_cq_tready,s_axis_cc_tdata[127:0],s_axis_cc_tuser[32:0],s_axis_cc_tlast,s_axis_cc_tkeep[3:0],s_axis_cc_tvalid,s_axis_cc_tready[3:0],pcie_rq_seq_num[3:0],pcie_rq_seq_num_vld,pcie_rq_tag[5:0],pcie_rq_tag_vld,pcie_cq_np_req,pcie_cq_np_req_count[5:0],cfg_phy_link_down,cfg_phy_link_status[1:0],cfg_negotiated_width[3:0],cfg_current_speed[2:0],cfg_max_payload[2:0],cfg_max_read_req[2:0],cfg_function_status[7:0],cfg_function_power_state[5:0],cfg_vf_status[11:0],cfg_vf_power_state[17:0],cfg_link_power_state[1:0],cfg_err_cor_out,cfg_err_nonfatal_out,cfg_err_fatal_out,cfg_ltr_enable,cfg_ltssm_state[5:0],cfg_rcb_status[1:0],cfg_dpa_substate_change[1:0],cfg_obff_enable[1:0],cfg_pl_status_change,cfg_tph_requester_enable[1:0],cfg_tph_st_mode[5:0],cfg_vf_tph_requester_enable[5:0],cfg_vf_tph_st_mode[17:0],cfg_fc_ph[7:0],cfg_fc_pd[11:0],cfg_fc_nph[7:0],cfg_fc_npd[11:0],cfg_fc_cplh[7:0],cfg_fc_cpld[11:0],cfg_fc_sel[2:0],cfg_interrupt_int[3:0],cfg_interrupt_pending[1:0],cfg_interrupt_sent,cfg_interrupt_msi_enable[1:0],cfg_interrupt_msi_vf_enable[5:0],cfg_interrupt_msi_mmenable[5:0],cfg_interrupt_msi_mask_update,cfg_interrupt_msi_data[31:0],cfg_interrupt_msi_select[3:0],cfg_interrupt_msi_int[31:0],cfg_interrupt_msi_pending_status[63:0],cfg_interrupt_msi_sent,cfg_interrupt_msi_fail,cfg_interrupt_msi_attr[2:0],cfg_interrupt_msi_tph_present,cfg_interrupt_msi_tph_type[1:0],cfg_interrupt_msi_tph_st_tag[8:0],cfg_interrupt_msi_function_number[2:0],sys_clk,sys_reset" */;
  output [3:0]pci_exp_txn;
  output [3:0]pci_exp_txp;
  input [3:0]pci_exp_rxn;
  input [3:0]pci_exp_rxp;
  output user_clk;
  output user_reset;
  output user_lnk_up;
  output user_app_rdy;
  input s_axis_rq_tlast;
  input [127:0]s_axis_rq_tdata;
  input [59:0]s_axis_rq_tuser;
  input [3:0]s_axis_rq_tkeep;
  output [3:0]s_axis_rq_tready;
  input s_axis_rq_tvalid;
  output [127:0]m_axis_rc_tdata;
  output [74:0]m_axis_rc_tuser;
  output m_axis_rc_tlast;
  output [3:0]m_axis_rc_tkeep;
  output m_axis_rc_tvalid;
  input m_axis_rc_tready;
  output [127:0]m_axis_cq_tdata;
  output [84:0]m_axis_cq_tuser;
  output m_axis_cq_tlast;
  output [3:0]m_axis_cq_tkeep;
  output m_axis_cq_tvalid;
  input m_axis_cq_tready;
  input [127:0]s_axis_cc_tdata;
  input [32:0]s_axis_cc_tuser;
  input s_axis_cc_tlast;
  input [3:0]s_axis_cc_tkeep;
  input s_axis_cc_tvalid;
  output [3:0]s_axis_cc_tready;
  output [3:0]pcie_rq_seq_num;
  output pcie_rq_seq_num_vld;
  output [5:0]pcie_rq_tag;
  output pcie_rq_tag_vld;
  input pcie_cq_np_req;
  output [5:0]pcie_cq_np_req_count;
  output cfg_phy_link_down;
  output [1:0]cfg_phy_link_status;
  output [3:0]cfg_negotiated_width;
  output [2:0]cfg_current_speed;
  output [2:0]cfg_max_payload;
  output [2:0]cfg_max_read_req;
  output [7:0]cfg_function_status;
  output [5:0]cfg_function_power_state;
  output [11:0]cfg_vf_status;
  output [17:0]cfg_vf_power_state;
  output [1:0]cfg_link_power_state;
  output cfg_err_cor_out;
  output cfg_err_nonfatal_out;
  output cfg_err_fatal_out;
  output cfg_ltr_enable;
  output [5:0]cfg_ltssm_state;
  output [1:0]cfg_rcb_status;
  output [1:0]cfg_dpa_substate_change;
  output [1:0]cfg_obff_enable;
  output cfg_pl_status_change;
  output [1:0]cfg_tph_requester_enable;
  output [5:0]cfg_tph_st_mode;
  output [5:0]cfg_vf_tph_requester_enable;
  output [17:0]cfg_vf_tph_st_mode;
  output [7:0]cfg_fc_ph;
  output [11:0]cfg_fc_pd;
  output [7:0]cfg_fc_nph;
  output [11:0]cfg_fc_npd;
  output [7:0]cfg_fc_cplh;
  output [11:0]cfg_fc_cpld;
  input [2:0]cfg_fc_sel;
  input [3:0]cfg_interrupt_int;
  input [1:0]cfg_interrupt_pending;
  output cfg_interrupt_sent;
  output [1:0]cfg_interrupt_msi_enable;
  output [5:0]cfg_interrupt_msi_vf_enable;
  output [5:0]cfg_interrupt_msi_mmenable;
  output cfg_interrupt_msi_mask_update;
  output [31:0]cfg_interrupt_msi_data;
  input [3:0]cfg_interrupt_msi_select;
  input [31:0]cfg_interrupt_msi_int;
  input [63:0]cfg_interrupt_msi_pending_status;
  output cfg_interrupt_msi_sent;
  output cfg_interrupt_msi_fail;
  input [2:0]cfg_interrupt_msi_attr;
  input cfg_interrupt_msi_tph_present;
  input [1:0]cfg_interrupt_msi_tph_type;
  input [8:0]cfg_interrupt_msi_tph_st_tag;
  input [2:0]cfg_interrupt_msi_function_number;
  input sys_clk;
  input sys_reset;
endmodule
