function calculate_ftest(obj)

%version for OnePortMEMSRes
    
    bw=floor(4/pi*obj.opt_obj.kt2.value*1000);
    bw=bw/1000;
    obj.f_test=linspace(...
        obj.opt_obj.f_center.value*(1-2*bw),...
        obj.opt_obj.f_center.value*(1+2*bw),...
        501);
    
end
