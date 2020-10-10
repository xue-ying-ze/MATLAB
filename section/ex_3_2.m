clear;
x = [0.6 0.7 0.8 0.9 1.0];
y = [1.433329 1.632316 1.896481 2.247908 2.718282];
P1 = polyinterp(x,y,[0.82,0.98]);
err = abs(P1-[exp(0.82^2),exp(0.98^2)]);
syms t
d = diff(exp(t^2),5);
max_err = abs(mult([0.82,0.98],x)).*eval(subs(d,t,1))./120;
errd = max_err-err;
x1 = 0.5:0.01:1;
x2 = 0:0.01:2;
P2 = polyinterp(x,y,x1);
P3 = polyinterp(x,y,x2);
plot(x1,P2-exp(x1.^2));
figure
plot(x2,P3-exp(x2.^2));

function y0 = polyinterp(x,y,x0)
    n = length(x);
    c = newtdd(x,y,n);
    y0 = nest(n-1,c,x0,x);
end

function e = mult(x,x0)
    n = length(x0);
    e = 1;
    for i = 1:n
       e =  e.*(x - x0(i));
    end
end