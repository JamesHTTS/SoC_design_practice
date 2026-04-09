`default_nettype none

module mux2to1 (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire       sel,
    output wire [7:0] y
);


assign y= (sel==0)? a:b;

endmodule
