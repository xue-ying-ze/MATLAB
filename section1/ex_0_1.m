pc=ones(1,51);
x = 1.00001;
p = nest(50,pc,x)
q = (x^51-1)/(x-1)
sub = abs(p-q)

function y = nest(d,c,x,b)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if nargin<4
    b=zeros(d,1);
end
y=c(d+1);
for i=d:-1:1
    y=y.*(x-b(i))+c(i);
end
end