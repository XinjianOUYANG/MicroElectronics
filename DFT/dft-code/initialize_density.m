function n=initialize_density(x,Ne)
  
  ## Initialize density to a Gaussian
  n=<CODE HERE>
  
  ## Normalize the density to the number of electrons
  n=n*Ne/integrate(x,n);
  
endfunction