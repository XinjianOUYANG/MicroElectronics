function uk = fcn(Ymin,xk,UTOTmax,A,B,C,Np)

% put all the parameters here
nx=size(C*A,1); % 2
nu=size(C*B,2); % 2
F=zeros(Np*nx,10);
H=zeros(Np*nx,Np*nu);

for i=1:Np
    F(nx*(i-1)+1:nx*i,:)=C*A^i;
    for j=1:i
        H(nx*(i-1)+1:nx*i,nu*(j-1)+1:nu*j)=C*A^(i-j)*B;
    end
end

T = zeros(Np,2*Np);
for i = 1:Np
    T(i,2*i-1:2*i) = [1,1];
end

Y_min = zeros(2*Np,1);
for i = 1:Np
    Y_min(2*i-1:2*i,1) = [Ymin(2*i-1,1);Ymin(2*i,1)];
end

Y_max = zeros(2*Np,1);
for i = 1:Np
    Y_max(2*i-1:2*i,1) = [inf;Ymin(2*i,1)+2];
end

Hz = eye(2*Np);

Al = [H;T;-H;-T];
% A 6*Np * 2*Np
b1 = [Y_max - F*xk; UTOTmax];
b2 = [-Y_min + F*xk; inf(Np,1)];
bl =[b1;b2];

lb = zeros(2*Np,1);
ub = 10*ones(2*Np,1);

coder.extrinsic('quadprog'); % may be changed if you want another solver

[Uopt] = quadprog(Hz,[],Al,bl,[],[],lb,ub);

uk=[0;0]; % the size of the controller output has to be defined

% only the first element is applied
uk = Uopt(1:2,1);