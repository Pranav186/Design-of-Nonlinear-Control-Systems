function [dz]=odefun4(t,z,lambda1,lambda2,lambda3)
    dz1=z(2)-lambda1*z(1);
    dz2=z(3)-lambda2*z(2)-z(1);
    dz3= -z(2)-lambda3*z(3);
   
    dz=[dz1;dz2;dz3];
end