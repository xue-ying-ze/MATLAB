function [fz,step] = gesect(f,x0,x1,E)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

