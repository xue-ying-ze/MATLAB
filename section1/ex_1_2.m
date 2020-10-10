f = @(x) x^5+x-1;
g = @(x) sin(x)-6*x-5;
h = @(x) log(x)+x^2-3;
fz = bisect(f,0,1,10^-8)
gz = bisect(g,-1,0,10^-8)
hz = bisect(h,1,2,10^-8)

function xc = bisect(f,a,b,tol)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
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