circlefit;
A=[-2*u,-2*v,ones(size(u))];
B=[-u.^2-v.^2];
x=A\B;
t=0:pi/40:2*pi;
%circle
r=sqrt(x(1)*x(1)+x(2)*x(2)-x(3));
X=r*cos(t)+x(1);
Y=r*sin(t)+x(2);
figure;
plot(u, v, 'o');
axis equal
hold;
plot(x(1), x(2), '*');
plot(X,Y,'k');
