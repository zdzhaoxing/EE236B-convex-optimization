% HW3.m
% Minimum fuel optimal control
clear all;

n = 3;
N = 30; 
A = [-1,0.4,0.8; 1,0,0;0,1,0];
b = [1;0;0.3];
x_des = [7;2;-6];
x_ini = [0;0;0];
% solve LP Problem
cvx_begin
    variable X(n,N+1);
    variable u(1,N);
    minimize (sum(max(abs(u), 2*abs(u)-1)))
    subject to
           X(:,1) == x_ini;
           X(:,N+1) == x_des;
           X(:,2:N+1) == A*X(:,1:N) + b*u;
cvx_end
% Plot
stairs(0:N-1,u,'Color','r');
xlabel('t')
ylabel('u(t)')