function uk = quad_fcn(Ymin,xk,UTOTmax,A,B,C,Np)

% put all the parameters here
nx=size(C*A,1); % 10
nu=size(C*B,2); % 4
F=zeros(Np*nx,nx);
H=zeros(Np*nx,Np*nu);

for i=1:Np
    F(nx*(i-1)+1:nx*i,:)=C*A^i;
    for j=1:i
        H(nx*(i-1)+1:nx*i,nu*(j-1)+1:nu*j)=C*A^(i-j)*B;
    end
end

R=eye(2);
Ru=zeros(nu*Np);
for i =1:Np
    Ru(nu*(i-1)+1:nu*i-2,nu*(i-1)+1:nu*i-2)=R;
end
Qx=zeros(nx*Np);

Hz = zeros((nx+nu)*Np);
Hz = blkdiag(Ru,Qx);

% Constraints
Aq = zeros(Np,(nx+nu)*Np);
for i = 1: Np
    Aq(i,(nx+nu)*(i-1)+1:(nx+nu)*i) = [ones(1,2),zeros(1,nx+nu-2)];
end
bq = UTOTmax;

Aeq = [-H eye(Np*nx)]; % Aeq*Z = beq
beq = F*xk;
% u_n = [u_k;y_k]
y1min = Ymin(1);  % flow
y1max = Inf;    
y2min = Ymin(2);    % temperature
y2max = y2min + 2;
Umin = repmat([0;0;y1min;y2min],Np,1);
Umax = repmat([10;10;y1max;y2max],Np,1);
lb = [Umin;-Inf*ones(Np*nx,1)];
ub = [Umax;Inf*ones(Np*nx,1)];

uk=[0;0]; % the size of the controller output has to be defined

coder.extrinsic('quadprog'); % may be changed if you want another solver

[Uopt]=quadprog(Hz,[],Aq,bq,Aeq,beq,lb,ub); % 

% only the first element is applied
uk = Uopt(1:2,1);
