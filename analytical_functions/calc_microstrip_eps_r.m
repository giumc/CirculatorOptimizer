function eps_eff=calc_microstrip_eps_r(microstrip)


%all eqns are from Hong-Lancaster, Chap 4
eps_r=microstrip.epsilon_r;
u=microstrip.width/microstrip.thickness;


a=1+1/49*log((u^4+(u/52)^2)/(u^4+0.432))+1/18.7*log(1+(u/18.1)^3);
b=0.564*((eps_r-0.9)/(eps_r+3))^(0.053);

eps_eff=(eps_r+1)/2+(eps_r-1)/2*(1+10/u)^-(a*b);
end
