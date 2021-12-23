function Vxc=get_Vxc(x,n,nu,R0)

  R0*=10e-9;
  a0=0.529e-10;
  Ryd=13.6*1.6e-19;
  e=1.6e-19;
  epsilon0=8.85418782e-12;
  hbar=1.05457148e-34;
  omega=2*pi*nu;
  m=9.10938188e-31;
  
  l=sqrt(hbar/m*omega);
  hbarom=hbar*omega;

  rs=0.5./(n*a0);
  drsdn=-0.5./(n.^2*a0);
  Rs=4*a0*rs/(pi*R0);  
  dRsdn=(4*a0/(pi*R0))*drsdn;
  Vxc=-2*a0/(pi*R0)*log(Rs)./Rs-(36.616*a0^2/R0^2)*rs \
      -2*a0/(pi*R0)*(1./Rs.^2-log(Rs)./Rs).*dRsdn \
      -(36.616*a0^2/R0^2)*2*rs.*drsdn;
  
  Vxc*=(Ryd*a0)/(l*hbarom);

endfunction