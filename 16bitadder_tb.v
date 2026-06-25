`include "16bitadder.v"
module tb_16bitadder ;
    reg [15:0] a,b;
    reg cin;
    wire [15:0] sum;
    wire sign,zero,cout,parity,overflow;

    adder16bit adder (a,b,cin,cout,sum,sign,zero,parity,overflow);    

    initial
    begin
        $dumpfile(16bitadder.vcd);
        $dumpvars(0,tb_16bitadder);
        $monitor($time,"a=%h,b=%h,cin=%b,cout=%b,sum=%h,sign=%b,zero=%b,parity=%b,overflow=%b",a,b,cin,cout,sum,sign,zero,parity,overflow);
        #5 a=16'h8fff ; b=16'h8000 ; cin = 0;
        #5 a=16'hfffe ; b=16'h0002 ;
        #5 a=16'haaaa ; b=16'h5555 ;
        #5 $finish;
    end
endmodule