clear all
dt=0.01;
t=0:dt:20;

e0=[1 1 1];

[t,e]=ode45(@(t,e) odefun_proj(t,e),t,e0);

theta1=1; theta2=2; theta3=3;
delta_des=sin(t);
delta_des_dot=cos(t);

lambda2=5;
lambda3=7;

e1=e(:,1);
e2=e(:,2);
e3=e(:,3);


figure
plot(t,e1)
hold on;
plot(t,e2)
hold on;
plot(t,e3)
hold on;
legend('e1','e2','e3');
title('error vs time')


%deriving virtual control input
delta=e1+delta_des;
w=e2+delta_des_dot;
Id_des=1/theta1*(theta2*(e2+delta_des_dot)+theta3-e1-lambda2*e2);
vd=Id_des-lambda3*e3;


figure
plot(t,delta)
hold on;
plot(t,delta_des)
legend('delta','delta-des');
title('delta and delta-des vs t')

figure 
plot(t,vd)
legend('v_d');
hold on
title('virtual control input vs t')

%deriving the actual control input
vc=0;
R=1;
L=1;
p=2;
Ic=1;
uc=(vc+R/L*Ic-p*w.*Id_des)*L;
ud=(vd+theta1*w+R/L*Id_des+p*w.*Ic)*L;

uc=uc';
ud=ud';

for i=1:length(t)
    R=[cos(p*delta(i)) -sin(p*delta(i));sin(p*delta(i)) cos(p*delta(i))];
    U(:,i)=R*[uc(i); ud(i)];
end

ua=U(1,:);
ub=U(2,:);

figure
plot(t,ua);
hold on;
plot(t,ub);
hold on;
legend('ua','ub');
title('control input vs time')