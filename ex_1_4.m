f1 = @(x) x^3 - 2*x -2;
[z1,s1] = newton(f1,2,10^-8);
f2 = @(x) exp(x) + x - 7;
[z2,s2] = newton(f2,0,10^-8);
f3 = @(x) exp(x) + sin(x) -4;
[z3,s3] = newton(f3,1,10^-8);