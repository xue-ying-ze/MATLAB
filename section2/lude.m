function  [L,U] = lude(A)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
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
% for i = n:-1:1
%    for j = i+1:n
%        b(i) = b(i) - a(i,j)*x(j);
%    end
%    x(i) = b(i)/a(i,i);
% end
L = tril(D,-1);
L = L+eye(n);
U = triu(a);
end



