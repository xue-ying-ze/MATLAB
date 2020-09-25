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

