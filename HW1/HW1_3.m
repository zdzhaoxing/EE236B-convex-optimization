clear;
illumdata;
%(a) Equal lamp powers
% f=[];
% p_max=ones(10,1);
% min = inf;
% p = 0;
% x = 0:0.0001:1
% for i=0:0.0001:1
%     t=max(abs(log(A*(p_max*i))));
%     if min >= t
%         min = t;
%         p = i;
%     end
%     f=[f;t];
% end
% plot(x,f')
% (b) Least-squares with saturation
% p = A\ones(20,1);
% p=[1;0;1;0;0;1;0;1;0;1]
% (c) Regularized least squares
% r=0.4677;
% C=r*eye(10);
% A1=[A;C];
% b1=[ones(20,1);r*0.5*ones(10,1)];
% p = A1\b1
% p 
% (d) Chebyshev approximation
% m = 10;
% cvx_begin
%     variable p(m)
%     minimize( norm(A*p - 1, inf))
%     subject to
%             p<=ones(m,1)
%             p>=0 
% cvx_end
% (e) Exact solution
m = 10
cvx_begin
    variable p(m)
    minimize(max([A*p;inv_pos(A*p)]))
    subject to
            p<=ones(m,1)
            p>=0
cvx_end

p
max(abs(log(A*p)))



