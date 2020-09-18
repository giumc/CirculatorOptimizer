close all
clear all
clc

frf=1;

fm=0.3;

nharm=2;

eps=0.3;

ql=20;

mod_phase=50;

z0=1;

fc=1;

l0=ql*z0/(2*pi*fc);

% c0=1/(2*pi*fc)^2/l0;

c0=0.1;

nlcap=OptNLCap('capacitance',c0,...
'mod_freq',fm,...
    'mod_depth',eps,...
    'mod_phase',mod_phase);

ind= OptInd('value',l0);
res=OptResistor('value',z0);

ftest=IMtones(frf,fm,nharm);

%m1=ind.seriesABCD(ftest)*nlcap.seriesABCD(ftest);
m1=nlcap.seriesABCD(ftest);
% nlcap.mod_phase.set_value(120,'override');
% 
% % m2=nlcap.seriesABCD(ftest)*...
%     ind.seriesABCD(ftest);
% 
% nlcap.mod_phase.set_value(240,'override');
% 
% m3=nlcap.seriesABCD(ftest)*...
%     ind.seriesABCD(ftest);

ABCD_tot=m1;

% ABCD_tot=res.seriesABCD(ftest)*ABCD_tot*res.shuntABCD(ftest);

[a,b,c,d]=ABCD_split(ABCD_tot);

vin=zeros(2*nharm+1,1);

vin(nharm+1)=1;

iin=d/b*vin;

% vout=a\vin;

disp([ftest,abs(iin),180/pi*angle(iin)])

%  disp([ftest,iin])
