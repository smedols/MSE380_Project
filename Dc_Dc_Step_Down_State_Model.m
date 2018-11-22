clear; close all; clc;

%Parameters (Units in SI)
L=1; 
C=1;
stepTime=0.01;
Tinitial=0;
Tfinal= 0.03;
t=Tinitial:stepTime:Tfinal;
Vin=5;
u=Vin;
u=zeros(1,length(t));
u(1,:)=Vin;
initial_cond=[0 0]'; 

%State Model - state vector [iL Vc]'
A=[ 0 -1/L; 1/C 0];
B=[ 1/L ; 0 ];
C=[ 0 1 ];
D=0;

%Simulate
% sys=ss(A,B,C,D);
% y=lsim(sys,u,t,initial_cond);
% figure
% plot(t,y)

[t,y] = ode45(@mymodel , [Tinitial Tfinal], initial_cond); %output t in sec
figure
plot(t,y)
title('ode45 plot')
xlabel('time (seconds)')
ylabel('iL vs Vc')

%For ode45
function xdot = mymodel(t,x)
    L=100*10^-3;
    C=6*10^-3;
    u=5;
    A=[ 0 -1/L; 1/C 0];   B=[ 1/L ; 0 ];
    C=[ 0 1 ];            D=0;
    
    xdot= A*x + B*u;
end


