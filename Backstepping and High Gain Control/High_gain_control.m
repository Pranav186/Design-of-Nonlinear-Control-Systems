clear all
x0=2*[0.5;0.5;0.5];
t=0:0.01:20;
l1=24;
l2=26;
l3=9;
K=2;
eps=0.5;
[t,x]=ode45(@(t,x) odefun3(t,x,l1,l2,l3,K,eps),t,x0);

u=-K^3*(l1*x(:,1)+l2*x(:,2)+l3*x(:,3));


x(:,1)=x(:,1);
x(:,2)=x(:,2)/K;
x(:,3)=x(:,3)/K^2;


figure
plot(t,x(:,1))
hold on;
plot(t,x(:,2))
hold on;
plot(t,x(:,3))
hold on;
legend('x1','x2','x3');
title('High Gain Control x vs t')

figure
plot(t,u)
title('High Gain Control Control Input vs time')
