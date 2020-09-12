classdef (Abstract) TwoPort < handle
   
    methods (Abstract,Access=protected)
       
        m=ABCD(obj,freq);
        beta=get_prop_const(obj,freq);
        
    end
    
    properties (Constant, Access=protected)
       
        epsilon_0=8.85418e-12;
        
        c_0=299.7e6;
        
    end
    
    methods
        
        ret=get_z_params(obj,freq);
        
        ret=get_y_params(obj,freq);
        
        ret=get_phase_lag(obj,freq);
        
    end
    
    methods(Static, Access=protected)
       
        m=convert_Z_to_ABCD(zmat);
        
        m=convert_Y_to_ABCD(ymat);
        
    end
    
end
