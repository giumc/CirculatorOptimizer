function beta=get_prop_const(obj,freq,varargin)

    %CoupledMicrostrip implementation
    
    v_eff=obj.c_0/((sqrt(obj.get_epsilon_even)+sqrt(obj.get_epsilon_odd))/2);
    
    beta=2*pi/v_eff*freq;
    
end
