a = [4 0
     3 1];
 c = [2 1
      1 -1
      2 1];
 [q,r]=qrde(a);
 [qc,rc] = qrde(c);
 [qc1,rc1] = qr(c,0);
 function [Q,R] = qrde(A)
    [m,n] = size(A);
    q = zeros(m,n);
    r = zeros(n,n);
    for j = 1:n
        y = A(:,j);
        for i = 1:j-1
            r(i,j)=q(:,i)'*A(:,j);
            y = y - r(i,j)*q(:,i);
        end
        r(j,j) = norm(y);
        q(:,j) =y/r(j,j);
    end
    Q = q;
    R = r;
 end