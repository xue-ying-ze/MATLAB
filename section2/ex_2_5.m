n = 100;
e = ones(n,1);
A = spdiags([e 2*e e],-1:1,n,n);
b = zeros(n,1);
b([1,end],1) = [1,-1];
x = ones(n,1);
x(2:2:end,1) = -1;
x0 = zeros(n,1);
[x1,n1] = jacobi(A,b,x0,1*10^-3);
bwe1 = norm(b- A*x1,inf);

[x2,n2] = gauss_seidel(A,b,x0,1*10^-3);
bwe2 = norm(b- A*x2,inf);

[x3,n3] = sor(A,b,x0,1*10^-3,1.5);
bwe3 = norm(b- A*x3,inf);
function [x,n] = jacobi(A,b,x0,E)
    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);
    n = 1;
    x = D\(b - (L+U)*x0);
    while norm(x-x0,inf)>E
        x0 = x;
        x = D\(b - (L+U)*x0);
        n = n+1;
    end
end

function [x,n] = gauss_seidel(A,b,x0,E)
    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);
    n = 1;
    x = (L+U)\(-U*x0 + b);
    while norm(x-x0,inf)>E
        x0 = x;
        x = (L+D)\(-U*x0 + b);
        n = n+1;
    end
end

function [x,n] = sor(A,b,x0,E,w)
    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);
    n = 1;
    x = (w*L + D)\((1-w)*D*x0 - w*U*x0) + w*(w*L +D)\b;
    while norm(x-x0,inf)>E
       x0 = x;
       x = (w*L + D)\((1-w)*D*x0 - w*U*x0) + w*(w*L +D)\b;
       n = n+1;
    end
end