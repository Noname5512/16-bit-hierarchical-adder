module tb_adder16bit
 ;
    reg [15:0] a,b;
    reg cin;
    wire [15:0] sum;
    wire sign,zero,cout,parity,overflow;

    adder16bit adder (a,b,cin,cout,sum,sign,zero,parity,overflow);    

    initial
    begin
        $dumpfile("adder16bit.vcd");
        $dumpvars(0,tb_adder16bit);
        $monitor($time,"a=%h,b=%h,cin=%b,cout=%b,sum=%h,sign=%b,zero=%b,parity=%b,overflow=%b",a,b,cin,cout,sum,sign,zero,parity,overflow);
        #5 a = 16'h0000; b = 16'h0000; cin = 0; // zero flag
        #5 a = 16'hFFFF; b = 16'h0001; cin = 0; // carry out
        #5 a = 16'h7FFF; b = 16'h0001; cin = 0; // positive overflow
        #5 a = 16'h8000; b = 16'h8000; cin = 0; // negative overflow
        #5 a = 16'hAAAA; b = 16'h5555; cin = 0; // alternating bits
    end
endmodule