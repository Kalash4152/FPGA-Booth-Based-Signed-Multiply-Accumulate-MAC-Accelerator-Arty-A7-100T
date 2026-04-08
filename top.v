module top (
    input  wire        CLK100MHZ,
    input  wire [3:0]  sw,
    input  wire        btn0,   // start
    input  wire        btn1,   // reset
    output wire [7:0]  LED
);

wire signed [7:0] A;
wire signed [7:0] B;

assign A = {{4{sw[3]}}, sw};
assign B = {{4{sw[3]}}, sw};

wire [31:0] mac_out;
wire vout;


// edge detect for start button
reg btn0_d;
always @(posedge CLK100MHZ)
    btn0_d <= btn0;

wire cycle_enable = btn0 & ~btn0_d;


mac mac_u (
    .clk         (CLK100MHZ),
    .rst         (btn1),      // reset button
    .cycle_enable(cycle_enable),
    .A           (A),
    .B           (B),
    .mac_out     (mac_out),
    .vout        (vout)
);


// LEDs
assign LED[7]   = vout;
assign LED[6]   = btn0;
assign LED[5:0] = mac_out[5:0];

endmodule
