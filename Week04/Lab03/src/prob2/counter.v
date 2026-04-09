`default_nettype none

module counter (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       en,
    output reg  [3:0] count
);

    // TODO: Implement 4-bit counter with enable and async reset
    // Use nonblocking assignment (<=)
    always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
    count <= 0;
    
    else if(en)
    count <= count+1;
    else count<=4'b0;
    end
endmodule
