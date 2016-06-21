`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hasan Hassan
// 
// Create Date: 08/18/2015 09:16:16 PM
// Design Name: 
// Module Name: pcie_data_receiver
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

`include "riffa.vh"

//Gets data from RIFFA and informs the Scheduler about data waiting to be processed
module pcie_data_receiver #(parameter C_PCI_DATA_WIDTH = 128) (
    input clk,
    input rst,
    
    //RIFFA Interface
    input CHNL_RX,
    output reg CHNL_RX_ACK,
    output CHNL_RX_DATA_REN,
    input CHNL_RX_DATA_VALID,
    input[C_PCI_DATA_WIDTH - 1:0] CHNL_RX_DATA,
    input[`SIG_CHNL_LENGTH_W - 1:0] CHNL_RX_LEN,
    
    //Scheduler Interface
    input dna_rd_en,
    output[C_PCI_DATA_WIDTH - 1:0] dna_data, //TODO: consider separate pci and dna data widths
    output[C_PCI_DATA_WIDTH - 1:0] dna_data_ref,
    output dna_valid,
    
    //Sender Interface
    output reg[`SIG_CHNL_LENGTH_W - 1:0] dna_len,
    input sender_ready,
    output reg sender_en
);

reg[C_PCI_DATA_WIDTH - 1:0] dna_r, dna_ref_r;
//reg dna_valid_r = 0;

reg[1:0] state = 0, state_next;
localparam STATE_IDLE = 2'b00;
localparam STATE_FETCH_REF = 2'b01;
localparam STATE_PROCESSING = 2'b10;

wire recv_fifo_full, recv_fifo_empty;
reg recv_fifo_wren = 1'b0;

//assign CHNL_RX_ACK = ~recv_fifo_full;
assign CHNL_RX_DATA_REN = (state != STATE_IDLE) && ~recv_fifo_full;


//next state combinational logic
always@* begin
    CHNL_RX_ACK = 1'b0;
    state_next = state;

    case(state)
        STATE_IDLE: begin
            //accept the transaction if the sender is ready
            if(sender_ready & CHNL_RX) begin
                CHNL_RX_ACK = 1'b1;
                
                //if(CHNL_RX_DATA_VALID) begin
                    state_next = STATE_FETCH_REF;
                //end
            end
        
        end //STATE_IDLE
        
        STATE_FETCH_REF: begin
            if(CHNL_RX_DATA_VALID) begin
                state_next <= STATE_PROCESSING;
            end        
        end //STATE_FETCH_REF
        
        STATE_PROCESSING: begin
            if(dna_len == 0 && ~recv_fifo_full) begin
                state_next = STATE_IDLE;
            end
        end //STATE_PROCESSING
    endcase
end

//next state sequential logic
always@(posedge clk) begin
    if(rst) begin
        state <= STATE_IDLE;
    end
    else begin
        state <= state_next;
    end
end

//calculate the length of the mapping and keep track of received data
always@(posedge clk) begin
    if(rst) begin
        dna_len <= 0;
        sender_en <= 1'b0;
    end
    else begin
        sender_en <= 1'b0;
        
        if(CHNL_RX_ACK /*&& CHNL_RX_DATA_VALID*/) begin
            dna_len <= CHNL_RX_LEN >> 2; //the first 4 words (16 bytes) are the reference dna data
            sender_en <= 1'b1;
        end
        else begin
            if(CHNL_RX_DATA_VALID && ~recv_fifo_full && (state != STATE_IDLE)) begin
                if(dna_len > 0)
                    dna_len <= dna_len - 1;
            end
        end
    end
end

//save the refrence dna data
always@(posedge clk) begin
    if(rst) begin
        dna_ref_r <= 0;
        dna_r <= 0;
        recv_fifo_wren <= 1'b0;
    end
    else begin
        if(CHNL_RX_DATA_VALID) begin
            case(state)
                STATE_IDLE: begin
                    recv_fifo_wren <= 1'b0;
                end //STATE_IDLE
                
                STATE_FETCH_REF: begin
                    dna_ref_r <= CHNL_RX_DATA;
                end
                
                STATE_PROCESSING: begin
                    if(~recv_fifo_full) begin
                        dna_r <= CHNL_RX_DATA;
                        recv_fifo_wren <= 1'b1;
                    end
                end
            endcase
        end // CHNL_RX_DATA_VALID
         else begin
             if(~recv_fifo_full) begin
                 recv_fifo_wren <= 1'b0;
             end
         end
    end
end


/*always@(posedge clk) begin
    if(rst) begin
        dna_valid_r <= 1'b0;
        dna_r <= 0;
        dna_ref_r <= 0;
        recv_fifo_wren <= 1'b0;
        
        state <= STATE_IDLE;
    end
    else begin
        recv_fifo_wren <= 1'b0;
    
        if(~recv_fifo_full) begin
            case(state)
                STATE_IDLE: begin
                    
                    if(sender_ready) begin
                        
                    end
                    if(CHNL_RX_DATA_VALID) begin
                        state <= S_DATA_REF;
                        dna_r <= CHNL_RX_DATA;
                    end
                end //S_DATA
                
                S_DATA_REF: begin
                    if(CHNL_RX_DATA_VALID) begin
                        state <= S_DATA;
                        dna_ref_r <= CHNL_RX_DATA;
                        recv_fifo_wren <= 1'b1;
                    end
                end //S_DATA_REF
            endcase
        end
    end
end*/

/*always@(posedge clk) begin
    if(rst) begin
        dna_len <= 0;
    end
    else begin
        if(CHNL_RX) begin
            dna_len <= CHNL_RX_LEN >> 5;
        end
    end
end*/

pcie_recv_fifo i_recv_fifo(
    .clk(clk),      // input wire clk
    .srst(rst),    // input wire srst
    .din({dna_r, dna_ref_r}),      // input wire [255 : 0] din
    .wr_en(recv_fifo_wren),  // input wire wr_en
    .rd_en(dna_rd_en & dna_valid),  // input wire rd_en
    .dout({dna_data, dna_data_ref}),    // output wire [255 : 0] dout
    .full(recv_fifo_full),    // output wire full
    .empty(recv_fifo_empty)  // output wire empty
);

assign dna_valid = ~recv_fifo_empty;


endmodule