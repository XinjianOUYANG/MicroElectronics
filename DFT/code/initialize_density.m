function n=initialize_density(x)
  
  n=exp(-x.^2);
  
  ## Normalize the density
  n/=integrate(x,n);
  
endfunction