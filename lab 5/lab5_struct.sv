module lab5_struct (
    input logic [3:0] num,      
    input logic [2:0] sel,      
    output logic [7:0] seg,
    output logic [7:0] AN
);
    assign seg[0] = (~num[3] & ~num[2] & ~num[1] & num[0]) | (~num[3] & num[2] & ~num[1] & ~num[0]) | (num[3] & num[2] & ~num[1] & num[0]) | (num[3] & ~num[2] & num[1] & num[0]);
    assign seg[1] = (num[3] & num[2] & ~num[0]) | (~num[3] & num[2] & ~num[1] & num[0]) | (num[3] & num[1] & num[0]) | (num[2] & num[1] & ~num[0]);
    assign seg[2] = (num[3] & num[2] & ~num[0]) | (num[3] & num[2] & num[1]) | (~num[3] & ~num[2] & num[1] & ~num[0]);
    assign seg[3] =  (~num[3] & ~num[2] & ~num[1] & num[0]) | (~num[3] & num[2] & ~num[1] & ~num[0]) | (num[3] & ~num[2] & num[1] & ~num[0]) | (num[2] & num[1] & num[0]);
    assign seg[4] = (~num[3] & num[2] & ~num[1]) |  (~num[3] & num[0]) | (~num[2] & ~num[1] & num[0]);
    assign seg[5] =(~num[3] & ~num[2] & num[1]) | (~num[3] & num[1] & num[0]) | (num[3] & num[2] & ~num[1] & num[0]) | (~num[3] & ~num[2] & num[0]);
    assign seg[6] = (num[3] & num[2] & ~num[1] & ~num[0]) | (~num[3] & num[2] & num[1] & num[0]) | (~num[3] & ~num[2] & ~num[1]);
    assign seg[7] = 0;
    
    assign  AN[0] = (sel[2] | sel[1] | sel[0]);
    assign  AN[1] = (sel[2] | sel[1] | ~sel[0]);
    assign  AN[2] = (sel[2] | ~sel[1] | sel[0]);
    assign  AN[3] = (sel[2] | ~sel[1] | ~sel[0]);
    assign  AN[4] = (~sel[2] | sel[1] | sel[0]);
    assign  AN[5] = (~sel[2] | sel[1] | ~sel[0]);
    assign  AN[6] = (~sel[2] | ~sel[1] | sel[0]);
    assign  AN[7] = (~sel[2] | ~sel[1] | ~sel[0]);

endmodule