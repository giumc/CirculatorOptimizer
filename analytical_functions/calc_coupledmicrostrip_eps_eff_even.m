function eps_eff_even=calc_coupledmicrostrip_eps_eff_even(coupledmicrostrip)

eps_r=coupledmicrostrip.line.epsilon_r;
g=coupledmicrostrip.spacing / coupledmicrostrip.line.thickness;
u=coupledmicrostrip.line.width / coupledmicrostrip.line.thickness;

v= u * (20 + g ^2 ) / (10 + g^2) +g *exp( - g );

a= 1+ 1/49 * log ( ( v^4 + (v/52)^2 )/( v^4 + 0.432 ) ) +...
    1/18.7 * log ( 1 + ( v / 18.1 )^3 );
b= 0.564 * ((eps_r -0.9)/(eps_r+3))^(0.053) ;

eps_eff_even=(eps_r+1)/2+(eps_r_1)/2 * (1 +10 / v) ^(-a * b);
end
