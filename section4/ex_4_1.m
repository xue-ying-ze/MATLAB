A1 = [3 -1 2
     4 1 0 
     -3 2 1
     1 1 5
     -2 0 3];
 b1 = [10 10 -5 15 0]';
 xa=(A1'*A1)\(A1'*b1);
 error1 = norm((b1-A1*xa));
 A2 = [4 2 3 0
      -2 3 -1 1
      1 3 -4 2
      1 0 1 -1
      3 1 3 -2];
  b2 = [10 0 2 0 5]';
  xb = (A2'*A2)\(A2'*b2);
  error2 = norm((b2-A2*xb));