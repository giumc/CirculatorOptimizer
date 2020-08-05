clear all
close all
clc

fres=1e9;
faxis=0.9e9:1e6:1.1e9;
kt2=0.02;
qu=1e3;
z_match=50;
ratio_cap=1.5;

filt=OptMEMSBPFilt('f_center',fres,'q_u',qu,...
    'ref_impedance',z_match,'kt2',kt2,'ratio_cap',ratio_cap);

for i=1:length(faxis)
    
    s(:,:,i)=S_param_linear(filt.ABCD(faxis(i)),z_match);
    
end

s21=squeeze(s(2,1,:));

plot(faxis/1e9,20*log10(abs(s21)))
