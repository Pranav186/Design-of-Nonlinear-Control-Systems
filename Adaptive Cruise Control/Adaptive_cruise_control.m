clear all
%initial conditions
s0=[1;1.5-1;2.5-1;3.5-1];

%timestep
dt=0.01;

t=0:dt:50;
lambda=5;
[t,s]=ode45(@(t,s) ode_adap_cruise_cont(t,s),t,s0);

v=s(:,1)+sin(t);

u=s(:,2).*(cos(t)-lambda*s(:,1))+s(:,3).*v.^2+s(:,4);

figure
plot(t,v(:,1));
hold on
plot(t,sin(t));
hold on
legend('v','ref-vel')
title('velocity and reference velocity')

figure
plot(t,s(:,2))
hold on
plot(t,s(:,3))
hold on
plot(t,s(:,4))
hold on
legend('mass','air-drag coeffiecient','friction force')
title('parameter updation')

figure 
plot(t,u);
title('control input')


