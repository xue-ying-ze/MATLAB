a = [2 -2 -1 -2
    4 1 -2 1
    -2 1 -1 -3];
ax = gauss(a);
b = [1 2 -1 2
    0 3 1 4
    2 -1 1 2];
bx = gauss(b);
c = [2 1 -4 -7
    1 -1 1 -2
    -1 3 -2 6];
cx = gauss(c);

function  x = gauss(Ab)
[n,c] = size(Ab);
a = Ab(1:n,1:n);
b = Ab(:,c);
for j = 1:n-1
    if abs(a(j,j))<eps; error('zero pivot encountered'); 
    end
    for i = j+1:n
       mult = a(i,j)/a(j,j);
       for k = j+1:n
           a(i,k) = a(i,k) - mult*a(j,k);
       end
       b(i) = b(i) - mult * b(j);
    end
end
for i = n:-1:1
   for j = i+1:n
       b(i) = b(i) - a(i,j)*x(j);
   end
   x(i) = b(i)/a(i,i);
end
end

