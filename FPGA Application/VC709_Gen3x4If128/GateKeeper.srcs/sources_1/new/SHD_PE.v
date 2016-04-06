`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hasan Hassan
// 
// Create Date: 08/24/2015 05:49:13 PM
// Design Name: 
// Module Name: SHD_PE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SHD_PE #(parameter DNA_DATA_WIDTH = 128) (
        input clk,
        input rst,
        
        //Scheduler Interface
        input[DNA_DATA_WIDTH - 1:0] dna_in,
        input[DNA_DATA_WIDTH - 1:0] dna_ref_in,
        input dna_valid_in,
        output dna_rd_en,
        
        //Collector Interface
        input coll_clk,
        input coll_rd_en,
        output[7:0] coll_dna_err,
        output coll_valid
    );
    
    
    //Register Input
    reg[DNA_DATA_WIDTH - 1:0] dna_r, dna_ref_r;
    reg dna_valid_r;
    
    always@(posedge clk) begin
        if(rst) begin
            dna_valid_r <= 1'b0;
            dna_r <= 0;
            dna_ref_r <= 0;
        end
        else begin
            if(~dna_valid_r || ~pe_fifo_full) begin
                dna_valid_r <= dna_valid_in;
                dna_r <= dna_in;
                dna_ref_r <= dna_ref_in;
            end
        end
    end
    
    wire[7:0] dna_err;
    SHD	#(.LENGTH(DNA_DATA_WIDTH)) i_SHD(
        .DNA_read(dna_r),
        .DNA_ref(dna_ref_r),    
        .DNA_MinErrors(dna_err)
    );
    
    wire pe_fifo_full, pe_fifo_empty;
    
    shd_pe_fifo i_pe_fifo (
      .wr_clk(clk),      // input wire wr_clk
      .rd_clk(coll_clk),
      .rst(rst),    // input wire srst
      .din(dna_err),      // input wire [7 : 0] din
      .wr_en(~pe_fifo_full && dna_valid_r),  // input wire wr_en
      .rd_en(coll_rd_en),  // input wire rd_en
      .dout(coll_dna_err),    // output wire [7 : 0] dout
      .full(pe_fifo_full),    // output wire full
      .empty(pe_fifo_empty)  // output wire empty
    );
    
    assign dna_rd_en = ~pe_fifo_full;
    assign coll_valid = ~pe_fifo_empty;
    
endmodule
