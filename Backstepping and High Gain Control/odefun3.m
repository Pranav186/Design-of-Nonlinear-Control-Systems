function [dx]=odefun3(t,x,l1,l2,l3,K,eps)
    dx1=x(2)+eps*sin(x(1)/eps);
    dx2=x(3)+eps*sin(x(2)/eps);
    dx3= -K^3*(l1*x(1)+l2*x(2)+l3*x(3))+eps*sin(x(3)/eps);
    

    dx=[dx1;dx2;dx3];
end