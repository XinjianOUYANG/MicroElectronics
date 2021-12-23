function VH=get_VH(x,n)

  xcut=0.1;
  Np=length(x);
  
  VH=zeros(size(x));

  for np=1:Np
    tmp=zeros(size(x));

    for mp=1:Np
      d=abs(x(np)-x(mp));

      if (abs(d)<xcut)
        tmp(mp)=1/xcut;
      else
        tmp(mp)=1/d;
      endif
      
    endfor
    VH(np)=integrate(x,n.*tmp);

  endfor

endfunction