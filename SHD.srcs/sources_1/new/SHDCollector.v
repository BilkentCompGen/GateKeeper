`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hasan Hassan
// 
// Create Date: 08/24/2015 06:22:28 PM
// Design Name: 
// Module Name: SHDCollector
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


module SHDCollector #(parameter DNA_DATA_WIDTH = 128, NUM_PES = 4) (
        input clk,
        input rst,
        
        //PE Interface
        output reg[NUM_PES - 1:0] pe_rd_en,
        input[NUM_PES*8 - 1:0] pe_data,
        input[NUM_PES - 1:0] pe_valid,
        
        //Sender Interface
        input sender_ready,
        output sender_data_valid,
        output[7:0] sender_data
    );
    
    
    //SHD PE iterator
    wire pe_fetched;
    parameter PE_BITS = $clog2(NUM_PES);
    reg[PE_BITS - 1:0] pe_iterator = 0;
    wire advance_pe_it;
    
    always@(posedge clk) begin
        if(rst) begin
            pe_iterator <= 0;
        end
        else begin
            if(advance_pe_it) begin
                pe_iterator <= pe_iterator + 1'b1;
            end
        end
    end
    
    assign advance_pe_it = pe_fetched;
    
    
    //Register Input
    reg[7:0] dna_err_r;
    reg dna_err_valid_r;
    wire accept_pe_data;
    
    always@(posedge clk) begin
        if(rst) begin
            dna_err_r <= 0;
            dna_err_valid_r <= 1'b0;
        end
        else begin
            if(accept_pe_data) begin
                dna_err_r <= pe_data[pe_iterator*8 +: 8];
                dna_err_valid_r <= pe_valid[pe_iterator];
            end
        end
    end
    
    always@* begin
        pe_rd_en = 0;
        pe_rd_en[pe_iterator] = accept_pe_data;
    end
    
    assign pe_fetched = accept_pe_data && pe_valid[pe_iterator];
    
    assign accept_pe_data = sender_ready;
    
    assign sender_data_valid = dna_err_valid_r;
    assign sender_data = dna_err_r;
        
endmodule
