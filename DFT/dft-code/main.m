## Calculation constants

Nh=10;     ## Number of basis functions
Nit=100;   ## Number of iterations : In a real calculation, this will
           ## not be a fixed value but iterations will stop when convergence is
           ## achieved.
Nel=3;     ## Number of electrons
beta=0.2;  ## Mixing parameter

## Physical constants
e=1.6e-19;  
epsilon0=8.85418782e-12;
hbar=1.05457148e-34;
m=9.10938188e-31;

## Problem parameters
nu=100;
omega=2*pi*nu;
g=e^2/(4*pi*epsilon0)*sqrt(2*m/(hbar*omega)^3)
R0=3;    ## radius of nanowire

## Form x
x=-5:0.1:5;

## Form the basis
[Hp,Hf]=hermite(x,Nh);

## Get the number of points
Np=size(x,2);

## Initialize the density to a Gaussian
n=initialize_density(x,Nel);

## Self-consistent loop
for nit=1:Nit
  <CODE HERE>
endfor