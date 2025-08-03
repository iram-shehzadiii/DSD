

module lab_3_tb();
    logic m;
    logic n;
    logic o;
    logic p;
    logic q;

localparam period = 10;

lab_3 bct (
    .a(m),
    .b(n),
    .c(o),
    .x(p),
    .y(q)
);

// Provide different combinations of the inputs to check validity of code
initial 
begin
    m=0; n=0; o=0;
    #period;
    m=0; n=0; o=1;
    #period;
    m=0; n=1; o=0;
    #period;
    m=0; n=1; o=1;
    #period;
    m=1; n=0; o=0;
    #period;
    m=1; n=0; o=1;
    #period;
    m=1; n=1; o=0;
   #period;
    m=1; n=1; o=1;
    #period;
    $stop;
end 

initial
begin
    $monitor("x=%b, y=%b, a=%b, b=%b, c=%b", p,q,m,n,o);
end

endmodule


