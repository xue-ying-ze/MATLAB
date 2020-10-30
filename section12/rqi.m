function [lam,u] = rqi(A,x,k)
    %瑞利商求特征值
    for j=1:k
        u=x/norm(x);
        lam=u'*A*u;
        x=(A-lam*eye(size(A)))\u;
    end
    u=x/norm(x);
    lam=u'*A*u;
end