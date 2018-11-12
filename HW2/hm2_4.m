clear all;
% initialze the data
[t,y] = spline_data;
M = 10;
N = length(t);
A = zeros(N,M+3);
G = zeros(M+1,M+3);
% get A
for i = 1:N
   [g,gp,gpp] = bsplines(t(i));
   A(i,:) = g';
end
% get G
for k = 1:M+1
    [g,gp,gpp] = bsplines(k-1);
    G(k,:) = gpp';
end
% solve CVX problems
cvx_begin
    variable x(M+3);
    minimize (norm(A*x-y));
    subject to
              G*x >= 0;
cvx_end

% plot spline function
a = linspace(0,10,1000);
f = zeros(1,1000);
for j = 1:1000
    [g,gp,gpp] = bsplines(a(j));
    f(j) = x' * g;
end
plot(t,y,'o','Color','b');
hold on;
plot(a,f,'-','Color','r');


