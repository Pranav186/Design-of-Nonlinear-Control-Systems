clear all
z0=2*[0.5;0.5;0.5];
dt=0.01;
t=0:dt:20;
lambda1=1;
lambda2=2;
lambda3=3;
eps=0.5;
[t,z]=ode45(@(t,z) odefun4(t,z,lambda1,lambda2,lambda3),t,z0);

z1=z(:,1);
z2=z(:,2);
z3=z(:,3);

z1_dot=z2-lambda1*z1;
z2_dot=z3-lambda2*z2-z1;
z3_dot=-z2-lambda3*z3;


figure
plot(t,z1)
hold on;
plot(t,z2)
hold on;
plot(t,z3)
hold on;
legend('z1','z2','z3');
title('Backstepping z vs t')

alpha1=-eps*sin(z1/eps)-lambda1*z1;
alpha1_dot=(-cos(z1/eps)-lambda1).*(z2+alpha1+eps*sin(z1/eps));

for i=length(alpha1_dot)-1
    alpha1_doubledot(i)=(alpha1_dot(i+1)-alpha1_dot(i))/dt;
end
alpha1_doubledot(i+1)=alpha1_doubledot(i);
alpha1_doubledot=alpha1_doubledot';

x(:,1)=z1;
x(:,2)=z2+alpha1;
x1=x(:,1);
x2=x(:,2);


alpha2=-eps*sin(x2/eps)+alpha1_dot-z1-lambda2*z2;
alpha2_dot=-cos(z2+alpha1/eps).*(z2_dot+alpha1_dot)+alpha1_doubledot-z1_dot-lambda2*z2_dot;

x(:,3)=z3+alpha2;
x3=x(:,3);


u=-eps*sin((z2+alpha1)/eps)+alpha2_dot-z2-lambda3*z3;


figure
plot(t,x(:,1))
hold on;
plot(t,x(:,2))
hold on;
plot(t,x(:,3))
hold on;
legend('x1','x2','x3');
title('Backstepping x vs t')


figure
plot(t,u)
title('Backstepping control input vs time')