classdef (Abstract) TwoPort < matlab.mixin.Heterogeneous & ...
          matlab.mixin.Copyable & handle
   
    methods (Abstract)
       
        m=ABCD(obj,freq);
        beta=get_prop_const(obj,freq);
        varargout=summary(obj);
        
    end
    
    properties (Constant, Access=protected)
       
        epsilon_0=8.85418e-12;
        
        c_0=299.7e6;
        
    end
    
    methods
        
        ret=get_z_params(obj,freq);
        
        ret=get_y_params(obj,freq);
        
        ret=get_phase_lag(obj,freq);
        
        plot_s21(obj,freq,z0,varargin);
        
        plot_s11(obj,freq,varargin);

        plot_dispersion(obj,freq);
        
        plot_phase_lag(obj,freq);
        
    end
    
    methods(Static, Access=protected)
       
        m=convert_Z_to_ABCD(zmat);
        
        m=convert_Y_to_ABCD(ymat);
        
        s=convert_ABCD_to_S(m,z0);
        
        y=convert_metre_to_mil(x);
        
        y=convert_mil_to_metre(x);
        
    end
    
end
