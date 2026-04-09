`default_nettype none

module alu_acc (
    input  logic       clk,
    input  logic       rst_n,
    input  logic [7:0] b,
    input  logic [2:0] op,
    input  logic       en,
    output logic [7:0] acc,
    output logic       zero
);

    // TODO: Implement ALU + Accumulator using SystemVerilog
    //
    // Step 1 — Combinational: ALU (use always_comb)
    //   logic [7:0] alu_result;
    //   always_comb begin ... end
    //
    // Step 2 — Sequential: Accumulator register (use always_ff)
    //   always_ff @(posedge clk or negedge rst_n) begin ... end
    //
    // Step 3 — Combinational: zero flag (use assign)
logic [7:0]alu_result;
always_comb begin
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
always_ff @(posedge clk or negedge rst_n) begin
  if(!rst_n)
  acc<=0;
  else if(en)
  acc <= alu_result;
  else acc <= acc;
  end

assign zero= (acc==0)? 1:0;

endmodule
