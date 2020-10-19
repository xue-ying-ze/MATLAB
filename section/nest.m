function y = nest(d,c,x,b)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
if nargin<4
    b=zeros(d,1);
end
y=c(d+1);
for i=d:-1:1
    y=y.*(x-b(i))+c(i);
end
end
