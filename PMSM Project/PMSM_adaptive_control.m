clear all
dt=1;
t=0:dt:200;

%initial conditions
e0=[1 1 1 0.5 1.5 2.5];

[t,e]=ode45(@(t,e) odefun_adap_proj2(t,e),t,e0);


lambda1=3;
lambda2=5;
lambda3=7;

%actual values of parameters
theta1=1;
theta2=2;
theta3=3;

e1=e(:,1);
e2=e(:,2);
e3=e(:,3);

e4=e(:,4);
e5=e(:,5);
e6=e(:,6);

%plotting errors
T=t(1:200);
figure
plot(T,e1(1:200))
hold on;
plot(T,e2(1:200))
hold on;
plot(T,e3(1:200))
hold on;
legend('e1','e2','e3');
title('error vs time')

%plotting parameters
figure
plot(t,e4)
hold on;
plot(t,e5)
hold on;
plot(t,e6)
hold on;
legend('theta1','theta2','theta3');
title('parameters vs t')


delta_des=sin(t);
delta_des_dot=cos(t);
delta_des_ddot=-sin(t);
w_des=delta_des_dot-lambda1*e1;
w_des_dot=delta_des_ddot-lambda1*(-lambda1*e(1));
delta=e1+delta_des;

%virtual control input
Id_des=(1./(e4)).*(e5.*(e2+w_des)+e6+w_des_dot-lambda2*e2);
Id_des_dot=zeros(size(Id_des));

for i=1:length(t)-1
    Id_des_dot(i)=(Id_des(i+1)-Id_des(i))/dt;
end
Id_des_dot(i+1)=Id_des_dot(i);
vd=Id_des_dot-lambda3*e3;
figure
plot(t(1:200),vd(1:200))
hold on
legend('vd')
title('virtual control vs time')

%plotting desired vs actual
w=e2+w_des;
Id=e2+Id_des;

% figure
% plot(t(1:30),w(1:30));
% hold on ;
% plot(t(1:30),w_des(1:30))
% title('delta and delta-desired')


%deriving actual control imput
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
plot(t(1:200),ua(1:200));
legend('ua');
title('control input vs time')
figure
plot(t(1:100),ub(1:100));
hold on;
legend('ub');
title('control input vs time')


