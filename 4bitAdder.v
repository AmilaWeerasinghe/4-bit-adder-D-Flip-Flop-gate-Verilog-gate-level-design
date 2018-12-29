module HalfAdder(a,b,s1,c1);
input a,b; output s1,c1;
xor g1(s1,a,b);
and g2(c1,a,b);
endmodule

module FullAdder(a,b,cin,sum,cout);
input a,b,cin;output sum,cout;
wire c1,s1,s2;
//assign{cout,s}= a+ b +cin;
HalfAdder g3(a,b,s1,c1);
HalfAdder g4(s1,cin,sum,s2);
xor g5(cout,s2,c1);
endmodule

module RippleCarryAdder4(a,b,cin,s,cout);
input[3:0] a,b; input cin;
output[3:0] s; output cout;
wire cout1,cout2,cout3;
FullAdder fa0(a[0],b[0],cin,s[0],cout1);
FullAdder fa1(a[1],b[1],cout1,s[1],cout2);
FullAdder fa2(a[2],b[2],cout2,s[2],cout3);
FullAdder fa3(a[3],b[3],cout3,s[3],cout);
endmodule
 



module stimulus;
reg[3:0] a,b;
wire [3:0] s;
wire cout;

RippleCarryAdder4 rca(a,b,1'b0,s,cout);
initial
begin
a<=4'b1100;
b<=4'b0010;
#1
$display("%d + %d = %d,%d",a,b,s,cout);
end
endmodule
