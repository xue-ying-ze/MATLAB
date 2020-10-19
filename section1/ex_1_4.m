f1 = @(x) x^3 - 2*x -2;
[z1,s1] = newton(f1,2,10^-8)
f2 = @(x) exp(x) + x - 7;
[z2,s2] = newton(f2,0,10^-8)
f3 = @(x) exp(x) + sin(x) -4;
[z3,s3] = newton(f3,1,10^-8)

function [fz,step] = newton(f,x0,E)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
syms x;
step = 0;
df = diff(f(x));
x1 = x0 - f(x0)/eval(subs(df,x0));
while abs(x1 - x0)>E
    x0 = x1;
    x1 = x0 - f(x0)/eval(subs(df,x0));
    step = step +1;
end
fz = x1;
end
