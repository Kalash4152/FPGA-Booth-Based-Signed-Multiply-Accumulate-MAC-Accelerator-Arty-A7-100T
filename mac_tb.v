`timescale 1ns/1ps

module mac_tb;

reg clk;
reg rst;
reg cycle_enable;
reg signed [7:0] A;
reg signed [7:0] B;

wire signed [31:0] mac_out;
wire vout;

mac dut (
    .clk(clk),
    .rst(rst),
    .cycle_enable(cycle_enable),
    .A(A),
    .B(B),
    .mac_out(mac_out),
    .vout(vout)
);

// clock
always #5 clk = ~clk;


// task to start one MAC operation
task mac_op;
input signed [7:0] a;
input signed [7:0] b;
begin
    @(posedge clk);
    A = a;
    B = b;
    cycle_enable = 1;

    @(posedge clk);
    cycle_enable = 0;

    wait(vout);
    @(posedge clk);

    $display("A=%d  B=%d  MAC=%d", a, b, mac_out);
end
endtask


initial begin
    clk = 0;
    rst = 1;
    cycle_enable = 0;
    A = 0;
    B = 0;

    #20;
    rst = 0;

    // 3*4 = 12
    mac_op(3,4);

    // 5*6 = 30  → total = 42
    mac_op(5,6);

    // (-2)*7 = -14 → total = 28
    mac_op(-2,7);

    // (-3)*(-3) = 9 → total = 37
    mac_op(-3,-3);

    // 8*2 = 16 → total = 53
    mac_op(8,2);

    #50;
    $finish;
end

endmodule
