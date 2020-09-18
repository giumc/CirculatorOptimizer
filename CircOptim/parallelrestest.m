close all
clear all
clc

frf=1;

fm=0.3;

nharm=3;

eps=0.1;

ql=5;

mod_phase=0;

z0=1;

fc=1;

c0=ql/(2*pi*fc*z0);

% c0=1/(2*pi*fc)^2/l0;

l0=1/(2*pi*fc)^2/c0;

nlres=OptNLParallelRes('f_center',fc,'q_loaded',ql,'q_unloaded',1e6);

nlres.mod_freq.set_value(fm,'override');

nlres.mod_depth.set_value(eps,'override');

nlres.mod_phase.set_value(mod_phase,'override');

nlres.set_ref_impedance(z0);


clc

ftest=IMtones(frf,fm,nharm);

resis=OptResistor('value',z0);

nlres.mod_phase.set_value(0,'override');

m1=nlres.seriesABCD(ftest);

nlres.mod_phase.set_value(120,'override');
% 
m2=nlres.seriesABCD(ftest);
% 
m2=m2*resis.shuntABCD(ftest);
% % 

nlres.mod_phase.set_value(240,'override');

m2=m2*nlres.seriesABCD(ftest);

m=ABCD_parallel_v2(m1,m2);

ABCD_tot=resis.seriesABCD(ftest)*m*resis.shuntABCD(ftest);


[a,b,c,d]=ABCD_split(ABCD_tot);

vin=zeros(2*nharm+1,1);

vin(nharm+1)=1;

iin=d/b*vin;

vout=a\vin;

% disp([ftest,abs(iin),180/pi*angle(iin)])
disp([ftest,abs(vout),180/pi*angle(vout)])
%  disp([ftest,iin])

