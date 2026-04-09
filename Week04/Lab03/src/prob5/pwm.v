`default_nettype none

module pwm (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] duty,
    output wire       pwm_out
);
 reg [7:0]count;
    // TODO: Implement PWM generator
    //
    // Step 1 (Sequential): 8-bit free-running counter
    //   - Increments every clock edge
    //   - Resets to 0 on async reset
    //
    // Step 2 (Combinational): Compare counter with duty
    //   - pwm_out = 1 when counter < duty
    //   - Use assign statement for this comparison
    always @(posedge clk or negedge rst_n) begin
    if(!rst_n) count<=0;
    else  count<=count+1;
    end
    
    assign pwm_out = ((count<duty) && (rst_n))? 1: 0;
    
    
endmodule
