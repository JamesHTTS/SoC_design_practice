`default_nettype none

module priority_enc (
    input  wire [3:0] req,
    output reg  [1:0] enc,
    output reg        valid
);

    // TODO: Implement priority encoder using always @(*) with if/else
    // req[3] has highest priority, req[0] has lowest
    // Don't forget default assignments to prevent latch inference!

    always @(*) begin
    {enc,valid}={2'b00,1'b0};
    if(req[3]) 
    {enc,valid}={2'b11,1'b1};
    else if(req[2])
    {enc,valid}={2'b10,1'b1};
    else if(req[1])
    {enc,valid}={2'b01,1'b1};
    else if(req[0])
    {enc,valid}={2'b00,1'b1};
    end
endmodule
