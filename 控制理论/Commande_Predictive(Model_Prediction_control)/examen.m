A = [2,1;0,2];
B = [1;0];
C = [1, 0];
nx=size(A,1);
nu=size(B,2);
A =C*A;
B=C*B;
w = 1;

Np=1;
F=zeros(Np*nx,nx);
H=zeros(Np*nx,Np*nu);

for i=1:Np
    F(nx*(i-1)+1:nx*i,:)= A^i ;
    for j=1:i
        H(nx*(i-1)+1:nx*i,nu*(j-1)+1:nu*j)=A^(i-j)*B;
    end
end

lambda = 1;
