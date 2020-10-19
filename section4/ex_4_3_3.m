c = [2 1
      1 -1
      2 1];
  [q,r] = houseqr(c);
  t=q*r;
 
  function [Q,R] = houseqr(A)
    [m,n] = size(A);
    H = eye(m,m);
    A1 = A;
    w = zeros(1,m);
    for j = 1:n
       H0 = eye(m,m);
       s = norm(A1(j:end,j));
       if A1(j,j)>=0
           w(j)=w(j)+s;
       else
           w(j)=w(j)-s;
       end
%        w(j)=w(j)+s;
       v = w(1,j:end)-A1(j:end,j)';
       v=v';
       P = v*v'/(v'*v);
       H1 = eye(size(P))-2*P;
       H0(j:end,j:end)=H1;
       A1 = H0*A1;
       H = H*H0;
    end
    R = A1;
    Q = H;
  end