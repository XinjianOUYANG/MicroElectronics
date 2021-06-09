function uk = fcn(Ymin,xk,UTOTmax,F,H,Np)

uk = [0;0];
coder.extrinsic('linprog');

%define the f in linprog
lamda1 = 0.001;
lamda2 = 0.005;

T1 = lamda1 * ones(1,2*Np);
T2 = lamda2 * ones(1,2*Np);

f = [T1,-T1,T2];

%define A and b in linprog
T = zeros(Np,2*Np);
for i = 1:Np
    T(i,2*i-1:2*i) = [1,1];
end

P = zeros(Np,2*Np);
for i = 1:Np
    P(i,2*i) = 1;
end

A = [zeros(Np,4*Np), T; -eye(2*Np), eye(2*Np), zeros(2*Np); P, -P, zeros(Np,2*Np)];
b = [UTOTmax; zeros(2*Np,1); 2*ones(Np,1)];

%define Aeq and beq in linprog
Aeq = [eye(2*Np),zeros(2*Np), -H; zeros(2*Np), eye(2*Np), zeros(2*Np)];
beq = [F*xk; Ymin];

[Uopt] = linprog(f,A,b,Aeq,beq,[],[]);

uk = Uopt(Np+1:Np+2,1);