module alu( input [31:0] operand1, input [31:0] operand2, input [2:0] opcode, output [31:0] result, output zero);

  reg [31:0] temp;

  always @(*)
    case (opcode)
      3'b000: temp = operand1 + operand2; // Addition
      3'b001: temp = operand1 - operand2; // Subtraction
      3'b010: temp = operand1 & operand2; // Bitwise OR
      3'b011: temp = operand1 | operand2; // Bitwise AND
      3'b101: temp = (operand1 < operand2) ? 32'b0001 : 32'b0000; // Set Less Than (SLT)
      default: temp = 32'bxxxxx; // Invalid opcode
    endcase

  assign result = temp;
  assign zero = (temp == 32'b0) ? 1'b1 : 1'b0;

endmodule
