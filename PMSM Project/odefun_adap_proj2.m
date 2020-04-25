function [de]=odefun_adap_proj2(t,e)
    theta1=1;
    theta2=2;
    theta3=3;
    
    gamma1=1/5;
    gamma2=1/5;
    gamma3=1/5;
    
    lambda1=3;
    lambda2=5;
    lambda3=7;
    
    %delta_des=sin(t);
    delta_des_dot=cos(t);
    delta_des_ddot=-sin(t);
    w_des=delta_des_dot-lambda1*e(1);
    
    
    w_des_dot=delta_des_ddot-lambda1*(-lambda1*e(1));
    Id_des=1/(e(4))*(e(5)*(e(2)+w_des)+e(6)+w_des_dot-lambda2*e(2));
    
    de1=-lambda1*e(1);
    de2=-(e(4)-theta1)*Id_des+(e(5)-theta2)*(e(2)+w_des)+(e(6)-theta3)-lambda2*e(2);
    de3=-lambda3*e(3);
    
    
    
    theta1_hat_dot=1/gamma1*(Id_des*e(2));
    theta2_hat_dot=-1/gamma2*((e(2)+w_des)*e(2));
    theta3_hat_dot=-1/gamma3*(e(2));
    
    de4=theta1_hat_dot;
    de5=theta2_hat_dot;
    de6=theta3_hat_dot;
    
    
    de=[de1;de2;de3;de4;de5;de6];
end