module full_adder_tb();
    logic m;
    logic n;
    logic o;
    logic x;
    logic y;

localparam period = 10;

full_adder bct (
    .a(m),
    .b(n),
    .c(o),
    .sum(x),
    .carry(y)
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
    $monitor("sum=%p, carry=%b, a=%b, b=%b, c=%b", x,y,m,n,o);
end

endmodule