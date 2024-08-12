//`include "processor.v"
module lin_search;
 reg clk1,clk2;
 integer k;
 pipe_MIPS32 mips(clk1,clk2);
 initial
 begin
  clk1=0;clk2=0;
  repeat(30)
    begin
        #5 clk1=1;  #5 clk1=0;
        #5 clk2=1;  #5 clk2=0;
end
end
initial 
   begin
     for(k=0;k<31;k=k+1)
       mips.Reg[k]=k;
       //mips.Reg[4]=8;
     mips.Mem[0]=32'h28090000;// ADDI R9,R0,0;
     mips.Mem[1]=32'h28010001;// ADDI R1,R0,1
     mips.Mem[2]=32'h28020002;//ADDI R2,R0,2
     mips.Mem[3]=32'h28030003;//ADDI R3,R0,3
     
     mips.Mem[4]=32'h28040001;//searcher //ADDI R4,R0,TO BE SEARCHED
     
     mips.Mem[5]=32'h0e94a000;//dummy
     
     mips.Mem[6]=32'h4242800;//subtractor // SUB R5,R1,R4
     mips.Mem[7]=32'h4443000; // SUB R6,R2,R4
     mips.Mem[8]=32'h4643800;// SUB R7,R3,R4
     
     mips.Mem[9]=32'h38A00003; // BEQZ R5, R9++
     mips.Mem[10]=32'h38C00002;// BEQZ R6,  R9++
     mips.Mem[11 ]=32'h38E00001;// BEQZ R7,  R9++
     mips.Mem[12]=32'h28090000;// ADDI R9,R0,1;
     mips.Mem[13]=32'hFC000000;//HALT........
     mips.HALTED=0;
     mips.PC=0;
     mips.TAKEN_BRANCH=0;
     
    $monitor("R9",mips.Reg[9]);
     #280
     for(k=0;k<10;k=k+1)
       $display("R%1D - %2d", k, mips.Reg[k]);
     end
   initial
     begin
      
       #300 $finish;
   end
endmodule

