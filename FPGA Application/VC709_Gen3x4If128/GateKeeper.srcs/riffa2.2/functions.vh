//`ifndef __FUNCTIONS_VH
//`define __FUNCTIONS_VH 1

`include "widths.vh"
`include "types.vh"
`include "ultrascale.vh"
`include "tlp.vh"

function integer clog2;
	input [31:0] v;
	reg [31:0] value;
	begin
		value = v;
		if (value == 1) begin
			clog2 = 0;
		end
		else begin
			value = value-1;
			for (clog2=0; value>0; clog2=clog2+1)
				value = value>>1;
		end
	end
endfunction
// clog2s -- calculate the ceiling log2 value, min return is 1 (safe).
function integer clog2s;
	input [31:0] v;
	reg [31:0] value;
	begin
		value = v;
		if (value == 1) begin
			clog2s = 1;
		end
		else begin
			value = value-1;
			for (clog2s=0; value>0; clog2s=clog2s+1)
				value = value>>1;
		end
	end
endfunction

function [ `EXT_TYPE_W - 1: 0 ] upkt_to_trellis_type;
    input [`UPKT_TYPE_W : 0 ] WR_UPKT_TYPE;
    begin
        /* verilator lint_off CASEX */
        casex(WR_UPKT_TYPE)
            {`UPKT_REQ_RD,1'bx}: upkt_to_trellis_type = `TRLS_REQ_RD;
            {`UPKT_REQ_WR,1'bx}: upkt_to_trellis_type = `TRLS_REQ_WR;
            {`UPKT_MSG   ,1'b0}: upkt_to_trellis_type = `TRLS_MSG_ND;
            {`UPKT_MSG   ,1'b1}: upkt_to_trellis_type = `TRLS_MSG_WD;
            default:             upkt_to_trellis_type = `TRLS_REQ_RD;
        endcase
        /* verilator lint_on CASEX */
    end
endfunction // if

function [`UPKT_TYPE_W - 1 : 0 ] trellis_to_upkt_type;
    input  [ `EXT_TYPE_W - 1 : 0 ] trellis_type;
    begin
        /* verilator lint_off CASEX */
        casex(trellis_type)
            `TRLS_REQ_RD : trellis_to_upkt_type = `UPKT_REQ_RD;
            `TRLS_REQ_WR : trellis_to_upkt_type = `UPKT_REQ_WR;
            `TRLS_MSG_ND : trellis_to_upkt_type = `UPKT_MSG; // We only use messages routed by address
            `TRLS_MSG_WD : trellis_to_upkt_type = `UPKT_MSG; // We only use messages routed by address
            default      : trellis_to_upkt_type = `UPKT_REQ_RD;
        endcase
        /* verilator lint_on CASEX */
    end
endfunction // if

function [ `EXT_TYPE_W - 1 : 0 ] tlp_to_trellis_type;
    input [`FMT_W + `TYPE_W - 1 : 0 ] tlp_type;
    begin
        /* verilator lint_off CASEX */
        casex(tlp_type)
            `TLP_REQ_RD: tlp_to_trellis_type = `TRLS_REQ_RD;
            `TLP_REQ_WR: tlp_to_trellis_type = `TRLS_REQ_WR;
            `TLP_CPL_ND: tlp_to_trellis_type = `TRLS_CPL_ND;
            `TLP_CPL_WD: tlp_to_trellis_type = `TRLS_CPL_WD;
            `TLP_MSG_ND: tlp_to_trellis_type = `TRLS_MSG_ND; // We only use messages routed by address
            `TLP_MSG_WD: tlp_to_trellis_type = `TRLS_MSG_WD; // We only use messages routed by address
            default:     tlp_to_trellis_type = `TRLS_REQ_RD;
        endcase
        /* verilator lint_on CASEX */
   end
endfunction // if

function [`FMT_W + `TYPE_W - 1 : 0 ] trellis_to_tlp_type;
    input  [`EXT_TYPE_W - 1 : 0 ]    trellis_type;
    input                            hdrlen_wr;
    reg [`FMT_W + `TYPE_W - 1 : 0 ]  temp;
    begin
        /* verilator lint_off CASEX */
        casex(trellis_type)
            `TRLS_REQ_RD: temp = `TLP_REQ_RD;
            `TRLS_REQ_WR: temp = `TLP_REQ_WR;
            `TRLS_CPL_ND: temp = `TLP_CPL_ND;
            `TRLS_CPL_WD: temp = `TLP_CPL_WD;
            `TRLS_MSG_ND: temp = `TLP_MSG_ND; // We only use messages routed by address
            `TRLS_MSG_WD: temp = `TLP_MSG_WD; // We only use messages routed by address
            default:      temp = `TLP_REQ_RD;
        endcase
        /* verilator lint_on CASEX */
        trellis_to_tlp_type = {temp[`FMT_W +`TYPE_W - 1 : `TYPE_W + 1], hdrlen_wr, temp[`TYPE_W-1:0]};
    end
endfunction // if

//`endif
