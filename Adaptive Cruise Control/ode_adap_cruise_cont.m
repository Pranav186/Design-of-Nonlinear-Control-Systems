function [ds]=ode_adap_cruise_cont(t,s)
    
    %gains for parameter adaptation law
    gamma1=1;
    gamma2=2;
    gamma3=3;
    lambda=5;
    
    %reference velocity
    v_des=sin(t);
    vdes_dot=cos(t);
    
    %actual values
    m=1;
    c=2;
    F=3;
    
    de=1/m*(-lambda*m*s(1)+(s(2)-m)*(vdes_dot-lambda*s(1))+(s(3)-c)*(s(1)+v_des)^2+(s(4)-F));
    
    m_hat_dot=-1/gamma1*(vdes_dot-lambda*s(1))*s(1);
    c_hat_dot=-1/gamma2*(s(1)+v_des)^2*s(1);
    F_hat_dot=-1/gamma3*s(1);

    ds=[de m_hat_dot c_hat_dot F_hat_dot]';
    
end