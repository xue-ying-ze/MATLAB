pc=ones(1,51);
x = 1.00001;
p = polyval(pc,x)
q = (x^51-1)/(x-1)
sub = abs(p-q)