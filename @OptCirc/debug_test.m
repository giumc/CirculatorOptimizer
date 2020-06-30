function debug_test (obj)

    f_test=1;
    
    freqs= IMtones(f_test,...
        obj.design.nlres.var.mod_freq.value,...
        obj.harmonics);
    
    s = obj.S_param(obj.load,freqs);

end
