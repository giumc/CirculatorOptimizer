function eps_eff_odd=get_epsilon_odd(obj,freq)

eps_r=obj.epsilon_r;
eps_microstrip_eff=obj.get_epsilon_eff;

g=obj.spacing / obj.thickness;
u=obj.width / obj.thickness;

a_o= 0.7287 * (eps_microstrip_eff -0.5 * (eps_r + 1)) * ...
    (1 - exp( -0.179 * u) );

b = 0.747 *eps_r / (0.15 + eps_r );

c = b - (b - 0.207 ) * exp( -0.414 * u );

d = 0.593 + 0.694 * exp( -0.562 * u );

eps_0 = eps_microstrip_eff +  ...
    (0.5 *(eps_r +1 ) - eps_microstrip_eff +a_o) * ...
    exp ( -c * (g ^d) ) ;

p=obj.get_p(freq);

f=obj.get_norm_freq(freq);

f_odd=p(1)*p(2)*((p(3)*p(4)+0.1844*p(15))*f)^1.5763;

eps_eff_odd=eps_r-(eps_r-eps_0)/(1+f_odd);
end
