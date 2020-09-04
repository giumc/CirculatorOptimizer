function Z_line=calc_microstrip_Z_line(microstrip)
%all eqns are from Hong-Lancaster, Chap 4
vacuumeta=120*pi;
eps_eff=microstrip.epsilon_eff;

u=microstrip.width/microstrip.thickness;%independent on units
F=6+(2*pi-6)*exp(-(30.666/u)^(0.7528));

Z_line=vacuumeta/2/pi/sqrt(eps_eff)*log(F/u+sqrt(1+(2/u)^2));
end
