function eps_eff_odd=calc_coupledmicrostrip_eps_eff_odd(coupledmicrostrip)

eps_r=coupledmicrostrip.line.epsilon_r;
eps_microstrip_eff=coupledmicrostrip.line.epsilon_eff;

g=coupledmicrostrip.spacing / coupledmicrostrip.line.thickness;
u=coupledmicrostrip.line.width / coupledmicrostrip.line.thickness;

a = 0.7287 * (eps_microstrip_eff -0.5 * (eps_r + 1)) * ...
    (1 - exp( -0.179 * u) );

b = 0.747 *eps_r / (0.15 + eps_r );

c = b - (b - 0.207 ) * exp( -0.414 * u );

d = 0.593 + 0.694 * exp( -0.529 * u );

eps_eff_odd = coupledmicrostrip.epsilon_eff_even + 0.5 * ...
    (eps_r +1 ) - coupledmicrostrip.epsilon_eff_even + a ] * ...
    exp ( -c * (g ^d) ) ;
end
