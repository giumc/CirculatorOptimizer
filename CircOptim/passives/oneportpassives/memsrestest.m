clear all
close all
clc

fres=1e9;
faxis=0.9e9:1e6:1.1e9;
kt2=0.02;
qu=1e3;
z_match=1e3;

res=OnePortPiezoRes('f_center',fres,'q_unloaded',qu,...
    'z_match',z_match,'kt2',kt2,'q_u',qu);

for i=1:length(faxis)
    
    y(i)=res.y(faxis(i));
    
end

plot(faxis/1e9,20*log10(abs(y)))
