function theta=get_phase_lag(obj,freq)

    beta=obj.get_prop_const(freq);
    
    l=obj.get_length;
    
    theta=mod(beta*l,2*pi);
    
end
