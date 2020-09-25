f = @(x) x^5+x-1;
g = @(x) sin(x)-6*x-5;
h = @(x) log(x)+x^2-3;
fz = bisect(f,0,1,10^-8)
gz = bisect(g,-1,0,10^-8)
hz = bisect(h,1,2,10^-8)