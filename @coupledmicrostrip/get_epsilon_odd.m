function eps_eff_odd=get_epsilon_odd(obj)

eps_r=obj.epsilon_r;
eps_microstrip_eff=obj.get_epsilon_eff;

g=obj.spacing / obj.thickness;
u=obj.width / obj.thickness;

a = 0.7287 * (eps_microstrip_eff -0.5 * (eps_r + 1)) * ...
    (1 - exp( -0.179 * u) );

b = 0.747 *eps_r / (0.15 + eps_r );

c = b - (b - 0.207 ) * exp( -0.414 * u );

d = 0.593 + 0.694 * exp( -0.529 * u );

eps_eff_odd = obj.get_epsilon_even + 0.5 * ...
    (eps_r +1 ) - obj.get_epsilon_even + a * ...
    exp ( -c * (g ^d) ) ;
end
