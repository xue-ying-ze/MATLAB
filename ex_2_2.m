a = [3 1 2
    6 3 4
    3 1 5];
[La,Ua] = lude(a);
b = [4 2 0
    4 4 2
    2 2 3];
[Lb,Ub] = lude(b);
c = [1 -1 1 2
    0 2 1 0
    1 3 4 4
    0 2 1 -1];
[Lc,Uc] = lude(c);


function  [L,U] = lude(A)
[n,~] = size(A);
a = A;
D = zeros(n,n);
for j = 1:n-1
    if abs(a(j,j))<eps; error('zero pivot encountered'); 
    end
    for i = j+1:n
       mult = a(i,j)/a(j,j);
       for k = j+1:n
           a(i,k) = a(i,k) - mult*a(j,k);
       end
       D(i,j) = mult;
    end
end

L = tril(D,-1);
L = L+eye(n);
U = triu(a);
end