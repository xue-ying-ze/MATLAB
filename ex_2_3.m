[a1,x1] = create(6);
b1=a1*x1;
x_a1 = a1\b1;
fwe1 = norm((x_a1-x1),inf);
bwe1 = norm((b1-a1*x_a1),inf);
g1=(fwe1/norm(x1,inf))/(bwe1/norm(b1,inf));
c1 = cond(a1,inf);

[a2,x2] = create(10);
b2=a2*x2;
x_a2 = a2\b2;
fwe2 = norm((x_a2-x2),inf);
bwe2 = norm((b2-a2*x_a2),inf);
g2=(fwe2/norm(x2,inf))/(bwe2/norm(b2,inf));
c2 = cond(a2,inf);

function [A,x] = create(n)
x = ones(n,1);
A = zeros(n);
for i = 1:n
   for j = 1:n
      A(i,j) = 5/(i+2*j-1); 
   end
end
end