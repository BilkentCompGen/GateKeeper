`timescale 1ns / 1ps

module SHD	#(parameter LENGTH = 200) (
//	clk,
DNA_read,
DNA_ref,    
DNA_MinErrors
//    ,
//    DNA_out,
//    DNA_nsh,
//    DNA_shl_one,
//    DNA_shl_two,
//    DNA_shr_one,
//    DNA_shr_two
);

//localparam LENGTH = 200;   // width of encoded input and output data

//input clk;
input [LENGTH-1:0] DNA_read, DNA_ref;
 reg [(LENGTH/2)-1:0] DNA_nsh, DNA_shl_one, DNA_shl_two, DNA_shr_one, DNA_shr_two, DNA_out;

output reg [7:0] DNA_MinErrors;

reg [LENGTH-1:0] DNA_1, DNA_2, DNA_3, DNA_4, DNA_5;
integer index, i;

//////////////////////////////////////////////////////////
//
//                Shifted Hamming Mask (SHM) Calculation
//
//////////////////////////////////////////////////////////

   always@(DNA_read or DNA_ref)
        begin
            ////////////////////////////////////////////////////////
            //
            //                Hamming Mask for Read & Reference
            //
            ////////////////////////////////////////////////////////
            DNA_1= DNA_ref ^ DNA_read;
            index=0;
            for (i = 0; i < LENGTH; i = i + 2)
            begin
                if(DNA_1[i] || DNA_1[i+1])
                    DNA_nsh[index] = 1'b1;            //Bp mismatch
                else
                    DNA_nsh[index] = 1'b0;            //Bp match
                index=index+1;
            end
            ////////////////////////////////////////////////////////
            //
            //                Speculative removal of short-matches (SRS)
            //
            ////////////////////////////////////////////////////////
            
            for (i = 0; i < (LENGTH/2)-1; i = i + 1)
            begin
                if (i<=(LENGTH/2)-3)
                begin
                    // pattern = '101'
                    if(DNA_nsh[i] && (~DNA_nsh[i+1]) && DNA_nsh[i+2])
                        DNA_nsh[i+1] = 1'b1;
                end
                
                if (i<=(LENGTH/2)-4)
                begin
                    // pattern = '1001'
                    if(DNA_nsh[i] && (~DNA_nsh[i+1]) && (~DNA_nsh[i+2]) && DNA_nsh[i+3])
                    begin
                        DNA_nsh[i+1] = 1'b1;
                        DNA_nsh[i+2] = 1'b1;
                    end
                end
            end
            
            
            
            
            ////////////////////////////////////////////////////////
            //
            //                Hamming Mask for Read<<1 & Reference
            //
            ////////////////////////////////////////////////////////
            DNA_2= DNA_ref ^ (DNA_read<<2);            //shift for 2bits coz each SNP is encoded by two bits
            index=0;
            for (i = 0; i < LENGTH; i = i + 2)
            begin
                if(DNA_2[i] || DNA_2[i+1])
                    DNA_shl_one[index] = 1'b1;            //Bp mismatch
                else
                    DNA_shl_one[index] = 1'b0;            //Bp match
                index=index+1;
            end
            DNA_shl_one[0]=1'b0;        //referencce bp mapped to empty bp due to shifting 
            ////////////////////////////////////////////////////////
            //
            //                Speculative removal of short-matches (SRS)
            //
            ////////////////////////////////////////////////////////
            
            for (i = 0; i < (LENGTH/2)-1; i = i + 1)
            begin
                if (i<=(LENGTH/2)-3)
                begin
                    // pattern = '101'
                    if(DNA_shl_one[i] && (~DNA_shl_one[i+1]) && DNA_shl_one[i+2])
                        DNA_shl_one[i+1] = 1'b1;
                end
                
                if (i<=(LENGTH/2)-4)
                begin
                    // pattern = '1001'
                    if(DNA_shl_one[i] && (~DNA_shl_one[i+1]) && (~DNA_shl_one[i+2]) && DNA_shl_one[i+3])
                    begin
                        DNA_shl_one[i+1] = 1'b1;
                        DNA_shl_one[i+2] = 1'b1;
                    end
                end
            end
            
            
            
            
            ////////////////////////////////////////////////////////
            //
            //                Hamming Mask for Read<<2 & Reference
            //
            ////////////////////////////////////////////////////////
            DNA_3= DNA_ref ^ (DNA_read<<4);            //shift for 4bits coz each SNP is encoded by two bits
            index=0;
            for (i = 0; i < LENGTH; i = i + 2)
            begin
                if(DNA_3[i] || DNA_3[i+1])
                    DNA_shl_two[index] = 1'b1;            //Bp mismatch
                else
                    DNA_shl_two[index] = 1'b0;            //Bp match
                index=index+1;
            end
            DNA_shl_two[0]=1'b0;        //referencce bp mapped to empty bp due to shifting 
            DNA_shl_two[1]=1'b0;        //referencce bp mapped to empty bp due to shifting 
            ////////////////////////////////////////////////////////
            //
            //                Speculative removal of short-matches (SRS)
            //
            ////////////////////////////////////////////////////////
            
            for (i = 0; i < (LENGTH/2)-1; i = i + 1)
            begin
                if (i<=(LENGTH/2)-3)
                begin
                    // pattern = '101'
                    if(DNA_shl_two[i] && (~DNA_shl_two[i+1]) && DNA_shl_two[i+2])
                        DNA_shl_two[i+1] = 1'b1;
                end
                
                if (i<=(LENGTH/2)-4)
                begin
                    // pattern = '1001'
                    if(DNA_shl_two[i] && (~DNA_shl_two[i+1]) && (~DNA_shl_two[i+2]) && DNA_shl_two[i+3])
                    begin
                        DNA_shl_two[i+1] = 1'b1;
                        DNA_shl_two[i+2] = 1'b1;
                    end
                end
            end
            
            
            
            
            ////////////////////////////////////////////////////////
            //
            //                Hamming Mask for Read>>1 & Reference
            //
            ////////////////////////////////////////////////////////
            DNA_4= DNA_ref ^ (DNA_read>>2);            //shift for 2bits coz each SNP is encoded by two bits
            index=0;
            for (i = 0; i < LENGTH; i = i + 2)
            begin
                if(DNA_4[i] || DNA_4[i+1])
                    DNA_shr_one[index] = 1'b1;            //Bp mismatch
                else
                    DNA_shr_one[index] = 1'b0;            //Bp match
                index=index+1;
            end
            DNA_shr_one[(LENGTH/2)-1]=1'b0;        //referencce bp mapped to empty bp due to shifting
            ////////////////////////////////////////////////////////
            //
            //                Speculative removal of short-matches (SRS)
            //
            ////////////////////////////////////////////////////////
            
            for (i = 0; i < (LENGTH/2)-1; i = i + 1)
            begin
                if (i<=(LENGTH/2)-3)
                begin
                    // pattern = '101'
                    if(DNA_shr_one[i] && (~DNA_shr_one[i+1]) && DNA_shr_one[i+2])
                        DNA_shr_one[i+1] = 1'b1;
                end
                
                if (i<=(LENGTH/2)-4)
                begin
                    // pattern = '1001'
                    if(DNA_shr_one[i] && (~DNA_shr_one[i+1]) && (~DNA_shr_one[i+2]) && DNA_shr_one[i+3])
                    begin
                        DNA_shr_one[i+1] = 1'b1;
                        DNA_shr_one[i+2] = 1'b1;
                    end
                end
            end
            
            
            
            
            ////////////////////////////////////////////////////////
            //
            //                Hamming Mask for Read>>1 & Reference
            //
            ////////////////////////////////////////////////////////
            DNA_5= DNA_ref ^ (DNA_read>>4);            //shift for 4bits coz each SNP is encoded by two bits
            index=0;
            for (i = 0; i < LENGTH; i = i + 2)
            begin
                if(DNA_5[i] || DNA_5[i+1])
                    DNA_shr_two[index] = 1'b1;            //Bp mismatch
                else
                    DNA_shr_two[index] = 1'b0;            //Bp match
                index=index+1;
            end
            DNA_shr_two[(LENGTH/2)-1]=1'b0;        //referencce bp mapped to empty bp due to shifting
            DNA_shr_two[(LENGTH/2)-2]=1'b0;        //referencce bp mapped to empty bp due to shifting
            ////////////////////////////////////////////////////////
            //
            //                Speculative removal of short-matches (SRS)
            //
            ////////////////////////////////////////////////////////
            
            for (i = 0; i < (LENGTH/2)-1; i = i + 1)
            begin
                if (i<=(LENGTH/2)-3)
                begin
                    // pattern = '101'
                    if(DNA_shr_two[i] && (~DNA_shr_two[i+1]) && DNA_shr_two[i+2])
                        DNA_shr_two[i+1] = 1'b1;
                end
                
                if (i<=(LENGTH/2)-4)
                begin
                    // pattern = '1001'
                    if(DNA_shr_two[i] && (~DNA_shr_two[i+1]) && (~DNA_shr_two[i+2]) && DNA_shr_two[i+3])
                    begin
                        DNA_shr_two[i+1] = 1'b1;
                        DNA_shr_two[i+2] = 1'b1;
                    end
                end
            end
    
    
    
            
            ////////////////////////////////////////////////////////
            //
            //                Final bit-vector
            //
            ////////////////////////////////////////////////////////
            DNA_out= DNA_nsh & DNA_shl_one & DNA_shl_two & DNA_shr_one & DNA_shr_two;
            ////////////////////////////////////////////////////////
            //
            //                Speculative removal of short-matches (SRS) Count
            //
            ////////////////////////////////////////////////////////
            
            DNA_MinErrors=0;
            
            for (i = (LENGTH/2)-1; i >0 ; i = i -4)
            begin
                if (i>3)
                begin
                    case ({DNA_out[i],DNA_out[i-1],DNA_out[i-2],DNA_out[i-3]})
                    4'b0000 : DNA_MinErrors=DNA_MinErrors+0;
                    4'b0101,4'b0110,4'b1001,4'b1010,4'b1011,4'b1101 :  DNA_MinErrors=DNA_MinErrors+2;
                    default : DNA_MinErrors=DNA_MinErrors+1;
                    endcase
                end
            end
            
            
        end 

endmodule
