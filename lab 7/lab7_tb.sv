\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
logic clk;
logic reset;
logic write;
logic [3:0] num;
logic [2:0] sel;
logic [6:0] seg;
logic [7:0] an;

lab7 UUT (
    .clk(clk),
    .reset(reset),
    .write(write),
    .num(num),
    .sel(sel),
    .seg(seg),
    .an(an)
);

initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end 

initial begin
    reset <= 1;
    write <= 0;
    num <= 4'b0000;
    sel <= 3'b000;

    @(posedge clk); reset <= 0;
    @(posedge clk); write <= 1;

    // Writing values to 7-segment display
    @(posedge clk); sel <= 3'b111; num <= 4'b0010;
    @(posedge clk); #5;
    @(posedge clk); sel <= 3'b110; num <= 4'b0000;
    @(posedge clk); #5;
    @(posedge clk); sel <= 3'b101; num <= 4'b0010;
    @(posedge clk); #5;
    @(posedge clk); sel <= 3'b100; num <= 4'b0011;
    @(posedge clk); #5;
    @(posedge clk); sel <= 3'b011; num <= 4'b1110;
    @(posedge clk); #5;
    @(posedge clk); sel <= 3'b010; num <= 4'b0001;
    @(posedge clk); #5;
    @(posedge clk); sel <= 3'b001; num <= 4'b0101;
    @(posedge clk); #5;
    @(posedge clk); sel <= 3'b000; num <= 4'b0011;
    @(posedge clk); #5;

    // Switching to read phase
    @(posedge clk); write = 0;
    @(posedge clk); sel <= 3'b111; $display("Reading 111: an=%b seg=%b", an, seg);
    @(posedge clk); sel <= 3'b110; $display("Reading 110: an=%b seg=%b", an, seg);
    @(posedge clk); sel <= 3'b101; $display("Reading 101: an=%b seg=%b", an, seg);
    @(posedge clk); sel <= 3'b100; $display("Reading 100: an=%b seg=%b", an, seg);
    @(posedge clk); sel <= 3'b011; $display("Reading 011: an=%b seg=%b", an, seg);
    @(posedge clk); sel <= 3'b010; $display("Reading 010: an=%b seg=%b", an, seg);
    @(posedge clk); sel <= 3'b001; $display("Reading 001: an=%b seg=%b", an, seg);
    @(posedge clk); sel <= 3'b000; $display("Reading 000: an=%b seg=%b", an, seg);
    @(posedge clk); 

    $stop;
end

// Debugging: Monitor anodes and segment values
initial begin
  $monitor("Time=%0t | reset=%b | write=%b | num=%b | sel=%b | an=%b | seg=%b | clk=%b", 
              $time, reset, write, num, sel, an, seg, clk);
end

endmodule