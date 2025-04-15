module alu (
    output reg [9:0] out,       // ALU result
    output reg valid,           // Indicates output is valid
    input wire [4:0] op1,       // Operand 1
    input wire [4:0] op2,       // Operand 2
    input wire [1:0] opcode,    // ALU operation code: 01=sub, 10=add, 11=mul
    input wire clk,             // Clock
    input wire reset            // Reset
);

  // Internal registers to hold input operands and opcode
  reg [4:0] op1Reg, op2Reg;
  reg [1:0] opcReg;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Reset all registers
      out     <= 10'd0;
      valid   <= 1'b0;
      op1Reg  <= 5'd0;
      op2Reg  <= 5'd0;
      opcReg  <= 2'd0;
    end else begin
      // Latch inputs into internal registers
      op1Reg  <= op1;
      op2Reg  <= op2;
      opcReg  <= opcode;

      // ALU operation logic
      case (opcode)
        2'b00: begin               // No operation
          out   <= 10'd0;
          valid <= 1'b0;
        end

        2'b01: begin               // Subtraction
          out   <= op1 - op2;
          valid <= 1'b1;
        end

        2'b10: begin               // Addition
          out   <= op1 + op2;
          valid <= 1'b1;
        end

        2'b11: begin               // Multiplication
          out   <= op1 * op2;
          valid <= 1'b1;
        end

        default: begin             // Safety fallback
          out   <= 10'd0;
          valid <= 1'b0;
        end
      endcase

      // Debug display (can be removed in final synthesis version)
      $display("time = %t, opcode = %b, op1 = %d, op2 = %d, out = %d", 
                $time, opcode, op1, op2, out);
    end
  end

endmodule
