function VH=get_VH(x,n)

  xcut=0.1; ## Introduce cutoff
  Np=length(x);
  
  VH=zeros(size(x));

  for np=1:Np
    tmp=zeros(size(x));
    
    
    for mp=1:Np
      d=abs(x(np)-x(mp));

      if (abs(d)<xcut) 
        <CODE HERE>
      else
        <CODE HERE>
      endif
      
    endfor
    VH(np)=<CODE HERE>

  endfor

endfunction