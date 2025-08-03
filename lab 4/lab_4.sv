
module lab_4(
    input logic a0,
    input logic a1,
    input logic b0,
    input logic b1,
    output logic r,
    output logic g,
    output logic b
    );
    assign r = ((~b1 & ~b0) | (a1 & a0) | (a0 & ~b1) | (a1 & ~b1) | (a1 & b1 & ~b0));
    assign g = ((~a1 & ~a0) | (b1 & b0) | (~a1 & b1) | (~a1 & b0) | (~a0 & b1));
    assign b = ((a1 & ~b1) | (~a1 & b1) | (a0 & ~b0) | (~a0 & b0));
endmodule