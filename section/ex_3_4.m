ax=[0 1 2 3];
ay=[3 5 4 1];
bx=[-1 0 3 4 5];
by=[3 5 1 1 1];
coeff1 = splinecoeff(ax,ay);
coeff2 = splinecoeff(bx,by);
splot(coeff1,ax,ay,1000);
figure,splot(coeff2,bx,by,100);


function coeff = splinecoeff(x,y)
    n = length(x);
    v1=0;vn=0;
    A=zeros(n,n);
    r=zeros(n,1);
    for i=1:n-1
        dx(i)=x(i+1)-x(i);
        dy(i)=y(i+1)-y(i);
    end
    for i=2:n-1
        A(i,i-1:i+1)=[dx(i-1) 2*(dx(i-1)+dx(i)) dx(i)];
        r(i)=3*(dy(i)/dx(i)-dy(i-1)/dx(i-1));
    end
    A(1,1)=1;
    A(n,n)=1;
    coeff=zeros(n,3);
    coeff(:,2)=A\r;
    for i=1:n-1
        coeff(i,3)=(coeff(i+1,2)-coeff(i,2))/(3*dx(i));
        coeff(i,1)=dy(i)/dx(i)-dx(i)/3*(2*coeff(i,2)+coeff(i+1,2));
    end
    coeff=coeff(1:n-1,:);
end

function [x1,y1] = splot(coe,x,y,k)
    [n,~] = size(coe);
    x1=[];y1=[];
    for i=1:n-1
        xs=linspace(x(i),x(i+1),k+1);
        dx=xs-x(i);
        ys=coe(i,3)*dx;
        ys=(ys+coe(i,2)).*dx;
        ys=(ys+coe(i,1)).*dx+y(i);
        x1=[x1;xs(1:k)'];
        y1=[y1;ys(1:k)'];
    end
    x1=[x1;x(end)];
    y1=[y1;y(end)];
    plot(x,y,'o',x1,y1);
end