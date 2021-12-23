function [Hp,Hf]=hermite(x,Nh)

  N=length(x);
  H0=ones(size(x));
  H1=2*x;

  Hp=[H0;H1];
  Hf=[H0.*exp(-x.^2/2)*pi^(-1/4)
      H1.*exp(-x.^2/2)*pi^(-1/4)/sqrt(2)];

  for n=3:Nh

    Hp=[Hp;
        2*x.*Hp(n-1,:)-2*(n-2)*Hp(n-2,:);
        ];

    Hf=[Hf;
        (Hp(n,:).*exp(-x.^2/2))/sqrt( prod([1:n-1])*(2^(n-1))*sqrt(pi))];

  endfor
endfunction