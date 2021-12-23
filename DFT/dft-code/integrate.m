function I=integrate(x,f)
  
  dx=diff(x)(1);
  I=sum(f)-0.5*(f(1)+f(length(f)));
  I=I*dx;

endfunction