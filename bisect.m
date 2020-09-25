function xc = bisect(f,a,b,tol)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if sign(f(a))*sign(f(b)) >= 0
    error('f(a)f(b)<0 notsatisfied')
end
fa = f(a);
fb = f(b);
while (b-a)/2>tol
    c = (a+b)/2;
    fc = f(c);
    if fc==0
        break
    end
    if sign(fc)*sign(fa)<0
        b = c;
        fb = fc;
    else
        a=c;
        fa=fc;
    end
end
xc = (a+b)/2;
end

