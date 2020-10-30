a = [10 -12 -6
    5 -5 -4 
    -1 0 3];
x = [1;0;0];
b = [-14 20 10
    -19 27 12
    23 -32 -13];
c = [8 -8 -4
    12 -15 -7
    -18 26 12];
d = [12 -4 -2
    19 -19 -10
    -35 52 27];
[lama,va] = powerit(a,x,50);
[lamb,vb] = powerit(b,x,50);
[lamc,vc] = powerit(c,x,50);
[lamd,vd] = powerit(d,x,100);

function [lam,u] = powerit(A,x,k)
    for j=1:k
        u=x/norm(x);
        x=A*u;
        lam=u'*x;
    end
    u=x/norm(x);
end