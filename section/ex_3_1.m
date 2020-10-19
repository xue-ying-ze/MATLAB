x = [0 1 2 3];
y = [1 2 5 10];
y0= polyinterp(x,y,(1:0.1:3));
x0 = 1:0.1:3;
plot(x0,x0.^2+1,x0,y0,'*');
legend('y=x^2+1','��ֵ���')

function y0 = polyinterp(x,y,x0)
    n = length(x);
    c = newtdd(x,y,n);
    y0 = nest(n-1,c,x0,x);
end