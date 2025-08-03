

module lab7 (input logic [3:0] num, 
        input [2:0] sel,
        input logic write, reset,clk,
        output logic [7:0] an,
        output logic [6:0] seg);

logic en0, en1, en2, en3, en4, en5, en6, en7, count_enable, clk_out;
logic [2:0] count_d, count_q;   //counter input data and output

logic q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16;

// First T Flip-Flop
always_ff @(posedge clk or posedge reset)
begin
    if (reset)
        q0 <= 0;
    else
        q0 <= !q0;
end

// Cascading T Flip-Flops
always_ff @(posedge q0 or posedge reset) begin if (reset) q1 <= 0; else q1 <= !q1; end
always_ff @(posedge q1 or posedge reset) begin if (reset) q2 <= 0; else q2 <= !q2; end
always_ff @(posedge q2 or posedge reset) begin if (reset) q3 <= 0; else q3 <= !q3; end
always_ff @(posedge q3 or posedge reset) begin if (reset) q4 <= 0; else q4 <= !q4; end
always_ff @(posedge q4 or posedge reset) begin if (reset) q5 <= 0; else q5 <= !q5; end
always_ff @(posedge q5 or posedge reset) begin if (reset) q6 <= 0; else q6 <= !q6; end
always_ff @(posedge q6 or posedge reset) begin if (reset) q7 <= 0; else q7 <= !q7; end
always_ff @(posedge q7 or posedge reset) begin if (reset) q8 <= 0; else q8 <= !q8; end
always_ff @(posedge q8 or posedge reset) begin if (reset) q9 <= 0; else q9 <= !q9; end
always_ff @(posedge q9 or posedge reset) begin if (reset) q10 <= 0; else q10 <= !q10; end
always_ff @(posedge q10 or posedge reset) begin if (reset) q11 <= 0; else q11 <= !q11; end
always_ff @(posedge q11 or posedge reset) begin if (reset) q12 <= 0; else q12 <= !q12; end
always_ff @(posedge q12 or posedge reset) begin if (reset) q13 <= 0; else q13 <= !q13; end
always_ff @(posedge q13 or posedge reset) begin if (reset) q14 <= 0; else q14 <= !q14; end
always_ff @(posedge q14 or posedge reset) begin if (reset) q15 <= 0; else q15 <= !q15; end
always_ff @(posedge q15 or posedge reset) begin if (reset) q16 <= 0; else q16 <= !q16; end
assign clk_out = q16;


//to select d_ff
assign en0 = write & (!sel[2]) & (!sel[1]) & (!sel[0]);
assign en1 = write & (!sel[2]) & (!sel[1]) & sel[0];
assign en2 = write & (!sel[2]) & sel[1] & (!sel[0]);
assign en3 = write & (!sel[2]) & sel[1] & sel[0];
assign en4 = write & sel[2] & (!sel[1]) & (!sel[0]);
assign en5 = write & sel[2] & (!sel[1]) & sel[0];
assign en6 = write & sel[2] & sel[1] & (!sel[0]);
assign en7 = write & sel[2] & sel[1] & sel[0];
assign count_enable = !write;

 logic [3:0] dq [7:0]; // 2D array to store outputs for 8 D flip-flops
 
always_ff @ (posedge clk or posedge reset) 
begin
    if (reset) begin
        dq[0] <=  4'b0000;
        dq[1] <=  4'b0000;
        dq[2] <=  4'b0000;
        dq[3] <=  4'b0000;
        dq[4] <=  4'b0000;
        dq[5] <=  4'b0000;
        dq[6] <=  4'b0000;
        dq[7] <=  4'b0000;
    end 
    else begin
        if (en0) dq[0] <=  num;
        if (en1) dq[1] <=  num;
        if (en2) dq[2] <=  num;
        if (en3) dq[3] <=  num;
        if (en4) dq[4] <=  num;
        if (en5) dq[5] <=  num;
        if (en6) dq[6] <=  num;
        if (en7) dq[7] <= num;
    end
end

//counter
always_comb count_d = count_q + 1;
always_ff@(posedge clk_out or posedge reset)
begin
    if (reset) begin
        count_q <=  3'b000;
    end
    else if (count_enable) begin
        count_q <=  count_d;
    end
end

//2 * 1
logic [2:0] c;
always_comb begin
    case (write)
        1'b1:c = sel;
        1'b0:c = count_q;
    endcase
end

//8 * 1 mux
logic [3:0] y;
always_comb begin
    case (c)
        3'b000:y = dq[0];
        3'b001:y = dq[1];
        3'b010:y = dq[2];
        3'b011:y = dq[3];
        3'b100:y = dq[4];
        3'b101:y = dq[5];
        3'b110:y = dq[6];
        3'b111:y = dq[7];
        default: y = 4'b0000;
    endcase
end

//decoder for cathode
always_comb begin
        case(y)
            4'b0000: seg = 7'b0000001; 
            4'b0001: seg = 7'b1001111; 
            4'b0010: seg = 7'b0010010; 
            4'b0011: seg = 7'b0000110; 
            4'b0100: seg = 7'b1001100; 
            4'b0101: seg = 7'b0100100; 
            4'b0110: seg = 7'b0100000; 
            4'b0111: seg = 7'b0001111; 
            4'b1000: seg = 7'b0000000; 
            4'b1001: seg = 7'b0000100; 
            4'b1010: seg = 7'b0001000; 
            4'b1011: seg = 7'b1100000; 
            4'b1100: seg = 7'b0110001; 
            4'b1101: seg = 7'b1000010; 
            4'b1110: seg = 7'b0110000; 
            4'b1111: seg = 7'b0111000; 
            default: seg = 7'b1111111;
        endcase
    end

//decoder for anode
always_comb begin
        case(c)
            3'b000: an = 8'b11111110; 
            3'b001: an = 8'b11111101; 
            3'b010: an = 8'b11111011;
            3'b011: an = 8'b11110111; 
            3'b100: an = 8'b11101111; 
            3'b101: an = 8'b11011111; 
            3'b110: an = 8'b10111111; 
            3'b111: an = 8'b01111111; 
            default: an = 8'b11111111; 
        endcase
    end


endmodule