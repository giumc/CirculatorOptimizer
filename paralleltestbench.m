clc
clear all
close all
z0=1;

ql=10;

fres=1;

c0=ql/(2*pi*fres)/z0;

l0=1/(2*pi*fres)^2/c0;

cap=OptCap('value',c0);

ind=OptInd('value',l0);

res=OptResistor('value',1);

ftest=(fres/2):0.01:(fres*3/2);
% ftest=fres;

for i=1:length(ftest)
    
    fx=IMtones(ftest(i),0.4,1);
    
    mind(:,:,i)=ind.seriesABCD(fx);
    
    mcap(:,:,i)=cap.seriesABCD(fx);
    
    mres(:,:,i)=res.seriesABCD(fx);
    
    mtt=ABCD_parallel_v2(mcap(:,:,i),mres(:,:,i));
    
    mt=ABCD_parallel_v2(mind(:,:,i),...
        mtt);
%     [mtt,rcond2(i)]=ABCD_parallel(mind(:,:,i),...
%         mt);
    mtot(:,:,i)=mt;
    
    s(:,:,i)=S_param_linear(mtot(:,:,i),z0);
    
end

s21=squeeze(s(1,2,:));

% plot(ftest,rcond1);

plot(ftest,abs(s21));
