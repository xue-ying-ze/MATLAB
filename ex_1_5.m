f1 = @(x) x^3 - 2*x -2;
[z1,st1] = gesect(f1,1,2,10^-10)
f2 = @(x) exp(x) + x- 7;
[z2,st2] = gesect(f2,1,2,10^-10)
f3 = @(x) exp(x) + sin(x) -4;
[z3,st3] = gesect(f3,1,2,10^-10)