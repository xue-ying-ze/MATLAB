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
