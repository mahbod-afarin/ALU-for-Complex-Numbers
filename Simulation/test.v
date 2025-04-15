module test;
  wire [9:0] out;
  wire valid;
  reg[4:0] op1, op2;
  reg[1:0] opcode;
  reg clk, reset;
  alu alu1(out, valid, opcode, op1, op2, clk, reset);
  
  
  always
  #5 clk = ~clk;
  
  initial
  begin
    op1 = 5'd21;
    op2 = 5'd5;
    opcode = 2'b10;
    clk = 0;
    reset = 1;
    #2
    reset = 0;
    #10
    op1 = 5'd24;
    op2 = 5'd11;
    opcode = 2'b01;
    #10
    op1 = 5'd11;
    op2 = 5'd12;
    opcode = 2'b11;
    #10
    op1 = 5'd21;
    op2 = 5'd5;
    opcode = 2'b00;
    
    #30
    $stop;
  end 
endmodule