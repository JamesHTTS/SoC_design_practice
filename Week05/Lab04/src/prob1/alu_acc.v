`default_nettype none
module alu_acc (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] b,
    input  wire [2:0] op,
    input  wire       en,
    output reg  [7:0] acc,
    output wire       zero
);
 reg [7:0]alu_result;
always @(*) begin
 case(op)
 3'b000: alu_result= (acc + b);
 3'b001: alu_result= (acc - b);
 3'b010: alu_result= (acc & b);
 3'b011: alu_result= (acc | b);
 3'b100: alu_result= (acc ^ b);
 3'b101: alu_result= (~acc);
 3'b110: alu_result= (acc << 1);
 3'b111: alu_result= (acc >> 1);
 default: alu_result = 8'b0;
 endcase
 end
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
  acc<=0;
  else if(en)
  acc <= alu_result;
  else acc <= acc;
  end
 assign zero= (acc==0)? 1:0;
endmodule
