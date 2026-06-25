module full_adder (a ,b ,cin,sum ,cout);

    input a,b,cin;
    output sum,cout;
    wire w1,w2,w3;
    xor x1 (w1,a,b);
    xor x2 (sum,w1,cin);
    and a1 (w2,a,b);
    and a2 (w3,w1,cin);
    or o1 (cout,w2,w3);

endmodule

module rca (cin,a,b,cout,sum);
    input cin;
    input [3:0] a,b;
    output [3:0] sum;
    output cout;
    wire [2:0] c;

    full_adder fa1 (a[0],b[0],cin,sum[0],c[0]);
    full_adder fa2 (a[1],b[1],c[0],sum[1],c[1]);
    full_adder fa3 (a[2],b[2],c[1],sum[2],c[2]);
    full_adder fa4 (a[3],b[3],c[2],sum[3],cout);
endmodule

module adder16bit (a,b,cin,cout,sum,sign,zero,parity,overflow);
    input [15:0] a,b;
    output [15:0] sum;
    input cin;
    wire [2:0] w;
    output sign,zero,cout,parity,overflow;
    
    assign sign = sum [15];
    assign zero = ~|sum;
    assign parity = ~^sum;
    assign overflow = (a[15]&b[15]&~sum[15]) | (~a[15]&~b[15]&sum[15]);

    rca a1 (cin,a[3:0],b[3:0],w[0],sum[3:0]);
    rca a2 (cin,a[7:4],b[7:4],w[1],sum[7:4]);
    rca a3 (cin,a[11:8],b[11:8],w[2],sum[11:8]);
    rca a4 (cin,a[15:12],b[15:12],cout,sum[15:12]);
endmodule