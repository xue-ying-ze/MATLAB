f = @(x) atan(x)./x;
v = commid(f,0,1,16);
v1 = commid(f,0,1,32);

function v = commid(f,a,b,N)
    x = linspace(a,b,N);
    h = (b-a)/N;
    for i=1:N-1
       xm(i) = (x(i)+x(i+1))/2; 
    end
    v = h*sum(f(xm));
end