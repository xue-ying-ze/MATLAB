f = @(x) x./sqrt(x.^2+9);
[va,ea] = comtrap(f,0,4,16);
[va1,ea1] = comtrap(f,0,4,32);

g = @(t) t.*exp(t);
[vc,ec] = comtrap(g,0,1,16);
[vc1,ec1] = comtrap(g,0,1,32);

function [v,e] = comtrap(f,a,b,N)
    x = linspace(a,b,N);
    h = (b-a)/N;
    S = 2*sum(f(x(2:end-1)));
    S = S+f(a)+f(b);
    v = h*S/2;
    e = abs(v-quadgk(f,a,b));
end 