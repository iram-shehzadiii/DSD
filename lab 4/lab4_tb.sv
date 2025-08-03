module lab_4_tb();
    logic m0;
    logic m1;
    logic n0;
    logic n1;   
    logic x;
    logic y;
    logic z;

localparam period = 10;

lab_4 uut (
    .a0(m0),
    .a1(m1),
    .b0(n0),
    .b1(n1),
    .r(x),
    .g(y),
    .b(z)
);

// Provide different combinations of the inputs to check validity of code
initial 
begin
    m1 = 0;  m0 = 0; n1 = 0; n0 = 0;
    #period;
    m1 = 0;  m0 = 0; n1 = 0; n0 = 1;
    #period;
    m1 = 0;  m0 = 0; n1 = 1; n0 = 0;
    #period;
    m1 = 0;  m0 = 0; n1 = 1; n0 = 1;
    #period;
    m1 = 0;  m0 = 1; n1 = 0; n0 = 0;
    #period;
    m1 = 0;  m0 = 1; n1 = 0; n0 = 1;
    #period;
    m1 = 0;  m0 = 1; n1 = 1; n0 = 0;
    #period;
    m1 = 0;  m0 = 1; n1 = 1; n0 = 1;
    #period;
    m1 = 1;  m0 = 0; n1 = 0; n0 = 0;
    #period;
    m1 = 1;  m0 = 0; n1 = 0; n0 = 1;
    #period;
    m1 = 1;  m0 = 0; n1 = 1; n0 = 0;
    #period;
    m1 = 1;  m0 = 0; n1 = 1; n0 = 1;
    #period;
    m1 = 1;  m0 = 1; n1 = 0; n0 = 0;
    #period;
    m1 = 1;  m0 = 1; n1 = 0; n0 = 1;
    #period;
    m1 = 1;  m0 = 1; n1 = 1; n0 = 0;
    #period;
    m1 = 1;  m0 = 1; n1 = 1; n0 = 1;
    #period;
    $stop;
end 

initial
begin
    $monitor("b=%b, g=%b, r=%b, a1=%b, a0=%b, b1=%b, b0=%b", z,y,x,m1,m0,n1,n0);
end

endmodule