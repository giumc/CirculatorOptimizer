function beta=get_prop_const(obj,freq,varargin)
    
    %Microstrip implementation
    
    eps_eff = obj.get_epsilon_eff();

    omega = 2*pi*freq;

    beta = omega/obj.c_0*sqrt(eps_eff);
    
end
