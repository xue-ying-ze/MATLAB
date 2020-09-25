f1 = @(x) 2*x*cos(x)- 2*x+sin(x^3);
f1_z = fzero(f1,[-0.1,0.2]);
baw = abs(f1(f1_z));
fow = abs(f1_z-0);
f2_z = bisect(f1,-0.1,0.2,10^-16);
