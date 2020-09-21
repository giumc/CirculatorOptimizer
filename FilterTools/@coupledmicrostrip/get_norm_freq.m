function f=get_norm_freq(obj,freq)

    f=freq/1e9*obj.get_thickness('metre')*1e3;
    
end
