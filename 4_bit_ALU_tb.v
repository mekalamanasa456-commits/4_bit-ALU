4_bit_ALU_tb.v
// Testbench for 4-Bit ALU
`timescale 1ns/1ps

module alu_4bit_tb;

reg [3:0] A;
reg [3:0] B;
reg [2:0] ALU_Sel;

wire [3:0] Result;
wire Carry;

// Instantiate ALU
alu_4bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Carry(Carry)
);

initial begin

    // Create waveform file
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_4bit_tb);

    // Input values
    A = 4'b0101;  // 5
    B = 4'b0011;  // 3

    $display("A     = %b (%d)", A, A);
    $display("B     = %b (%d)", B, B);
    $display("--------------------------------");

    // ADD
    ALU_Sel = 3'b000;
    #10;
    $display("ADD       : Result = %b, Carry = %b",
             Result, Carry);

    // SUBTRACT
    ALU_Sel = 3'b001;
    #10;
    $display("SUBTRACT  : Result = %b, Carry = %b",
             Result, Carry);

    // AND
    ALU_Sel = 3'b010;
    #10;
    $display("AND       : Result = %b, Carry = %b",
             Result, Carry);

    // OR
    ALU_Sel = 3'b011;
    #10;
    $display("OR        : Result = %b, Carry = %b",
             Result, Carry);

    // XOR
    ALU_Sel = 3'b100;
    #10;
    $display("XOR       : Result = %b, Carry = %b",
             Result, Carry);

    // NOT
    ALU_Sel = 3'b101;
    #10;
    $display("NOT A     : Result = %b, Carry = %b",
             Result, Carry);

    // Increment
    ALU_Sel = 3'b110;
    #10;
    $display("INCREMENT : Result = %b, Carry = %b",
             Result, Carry);

    // Decrement
    ALU_Sel = 3'b111;
    #10;
    $display("DECREMENT : Result = %b, Carry = %b",
             Result, Carry);

    $finish;

end

endmodule