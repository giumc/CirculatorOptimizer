close all
clear all
clc

frf=1;

fm=0.3;

nharm=5;

c0=0.1;

eps=0.3;

mod_phase=0;

z0=1;

nlcap=OptNLCap('capacitance',c0,...
'mod_freq',fm,...
    'mod_depth',eps,...
    'mod_phase',mod_phase);

ftest=IMtones(frf,fm,nharm);

ABCD_tot=nlcap.seriesABCD(ftest);

[a,b,c,d]=ABCD_split(ABCD_tot);

vin=zeros(2*nharm+1,1);

vin(nharm+1)=1;

% [a,b,c,d]=ABCD_split(ABCD_tot);

iin=d/b*vin;

disp([ftest,imag(iin)])
