module alu(out, valid, opcode, op1, op2, clk, reset);
  output reg[9:0] out;
  output reg valid;
  input[4:0] op1, op2;
  input[1:0] opcode;
  input clk, reset;
  
  reg[4:0] op1Reg, op2Reg;
  reg[1:0] opcReg;
  
  always @(posedge clk or posedge reset)
  begin
    if(reset == 1)
      begin
        out <= 0;
        valid <= 0;
        op1Reg <= 0;
        op2Reg <= 0;
        opcReg <= 0;
      end
    else
      begin
        op1Reg <= op1;
        op2Reg <= op2;
        opcReg <= opcode;
        
        $display("time = %t, opc=%b", $time, opcReg);
        
        case(opcReg)
          2'b00:
          begin 
            valid <= 0;
            out <= 0;
          end
          2'b01:
          begin
            out <= op1Reg - op2Reg;
            valid <= 1;
          end
          2'b10:
          begin
            out <= op1Reg + op2Reg;
            valid <= 1;
          end
          
          2'b11:
          begin
            out <= op1Reg * op2Reg; 
            valid <= 1;
          end
        endcase
      end
  end
  
endmodule
