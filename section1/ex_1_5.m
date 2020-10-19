f1 = @(x) x^3 - 2*x -2;
[z1,st1] = gesect(f1,1,2,10^-10)
f2 = @(x) exp(x) + x- 7;
[z2,st2] = gesect(f2,1,2,10^-10)
f3 = @(x) exp(x) + sin(x) -4;
[z3,st3] = gesect(f3,1,2,10^-10)

function [fz,step] = gesect(f,x0,x1,E)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
step = 0;
x_0 = x0;
x_1 = x1;
x_2 = x1+1;
while abs(x_0-x_1)>E
    x_2 = x_1 - (f(x_1)*(x_1 - x_0))/(f(x_1) - f(x_0));
    x_0 = x_1;
    x_1 = x_2;
    step = step +1;
end
fz = x_2;
end
