clear all
close all
clc

fres=1e9;
faxis=0.9e9:1e6:1.1e9;
kt2=0.05;
qu=1e3;
z_match=1;
ratio_cap=2;

filt=OptMEMSBPFilt('order',8,'f_center',fres,'q_u',qu,...
    'ref_impedance',z_match,'kt2',kt2,'ratio_cap',ratio_cap);


for i=1:length(faxis)
    
    s(:,:,i)=filt.calculate_S_lin_response(faxis(i));
    
end

s21=squeeze(s(2,1,:));
s11=squeeze(s(1,1,:));
plot(faxis/1e9,20*log10(abs(s21)))
hold on
plot(faxis/1e9,20*log10(abs(s11)))
