function Z_line=get_Z_line(obj)

%all eqns are from Hong-Lancaster, Chap 4

vacuumeta=120*pi;

eps_eff=obj.get_epsilon_eff;

u=obj.width/obj.thickness;

F=6+(2*pi-6)*exp(-(30.666/u)^(0.7528));

Z_line=vacuumeta/2/pi/sqrt(eps_eff)*log(F/u+sqrt(1+(2/u)^2));

end
