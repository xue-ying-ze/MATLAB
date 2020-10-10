n = 1000;
e = ones(n,1);
m = 1:1:n;
A = spdiags([e/2 e/2 m' e/2 e/2],-2:2,n,n);
spy(A);
xe = ones(n,1);
b = A*xe;
x0 = zeros(n,1);
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
I = eye(n);
w = 1;
M1 = D;
M2 = (I+w*L*inv(D))*(D+w*U);
[xn,st1,er1] = cg(A,b,x0,10^-8,40);
[xj,st2,er2] = pecg(A,b,x0,10^-8,M1,40);
[xs,st3,er3] = pecg(A,b,x0,10^-8,M2,40);
plot(1:st1,er1);
legend('CG method');
figure
plot(1:st2,er2,1:st3,er3);
legend('Jacobi PCG','Gauss Seidel PCG');


function [x,n,err] = cg(A,b,x0,E,iter)
    d0 = b-A*x0;
    r0 = d0;
    r = r0;
    n =0;
    while n<iter
       alpha = r0'*r0/(d0'*A*d0);
       x = x0 +alpha*d0;
       r = r0 -alpha*A*d0;
       beta = r'*r/(r0'*r0);
       d = r +beta*d0;
       r0 = r;
       d0 = d;
       x0 = x;
       n = n+1;
       err(n)=norm(b-A*x)/norm(b);
       if norm(r)<E
           break
       end
    end
end

function [x,n,err] = pecg(A,b,x0,E,M,iter)
    r0 = b-A*x0;
    d0= (M)\r0;
    z0 = d0;
    r = r0;
    n =0;
    while n<iter
       alpha = r0'*z0/(d0'*A*d0);
       x = x0 +alpha*d0;
       r = r0 -alpha*A*d0;
       z = M\r;
       beta = r'*z/(r0'*z0);
       d = z +beta*d0;
       z0 = z;
       r0 = r;
       d0 = d;
       x0 = x;
       n = n+1;
       err(n)=norm(b-A*x)/norm(b);
       if norm(r)<E
           break
       end
    end
end