function [de]=odefun_proj(t,e)
    theta1=1;
    theta2=2;
    theta3=3;
    
    delta_des_dot=cos(t);
    lambda2=5;
    lambda3=7;
    
    Id_des=1/theta1*(theta2*(e(2)+delta_des_dot)+theta3-e(1)-lambda2*e(2));
    vd=Id_des-lambda3*e(3);
    
    de1=e(2);
    de2=theta1*Id_des-theta2*(e(2)+delta_des_dot)-theta3;
    de3=vd-Id_des;
    
    de=[de1;de2;de3];
end