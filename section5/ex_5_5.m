[x,c] = lgwt(4,-1,1);
f = @(x) x.^3+2.*x;
g = @(x) x.^4;
v = c'*f(x);
v1 = c'*g(x);