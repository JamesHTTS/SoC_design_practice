`default_nettype none

module barrel_shifter (
    input  wire [7:0] data,
    input  wire [2:0] shamt,
    output reg  [7:0] y
);

    // TODO: Implement left-rotate barrel shifter
    // shamt=0: y = data (no rotation)
    // shamt=1: y = {data[6:0], data[7]}
    // shamt=2: y = {data[5:0], data[7:6]}
    // ... etc
    //
    // Hint: Use case statement, or try:
    //   y = (shamt == 0) ? data : ...
    //   Or use concatenation trick with {data, data}
    always @(*) begin
    case(shamt)
     3'b000: y=data[7:0];
     3'b001: y={data[6:0],data[7]};
     3'b010: y={data[5:0],data[7:6]};
     3'b011: y={data[4:0],data[7:5]};
     3'b100: y={data[3:0],data[7:4]};
     3'b101: y={data[2:0],data[7:3]};
     3'b110: y={data[1:0],data[7:2]};
     3'b111: y={data[0],data[7:1]};
     default y=data[7:0];
    endcase
    end
endmodule
