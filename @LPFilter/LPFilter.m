classdef LPFilter < NormalizedFilter
   
    properties (Access=private)
        
        def_omega_c=1;
        def_z_term=1;
        
    end
    
    properties (Access=protected)
        
        omega_axis=def_omega_c*(0.01:0.01:3);
        domega_axid=def_omega_c*0.01;
        
    end
    
    properties (SetAccess=protected)
       
        omega_c=def_omega_c;
        z_term=def_z_term;
        
    end
    
    methods 
       
        function obj=LPFilter(coeffs,omega_c,z_term)
        
            obj@NormalizedFilter(coeffs);
            
            obj.set_omega_c(omega_c);
            
            obj.set_z_term(z_term);
        
        end
        
        function set_omega_c(obj,omega_c)
            
            obj.omega_c=omega_c;
            
            obj.set_components();
            
        end
        
        function set_z_term(obj,z_term)
        
            obj.z_term=z_term;
            
            obj.set_components();
        
        end
        
    end
    
    methods (Access=protected)
    
        set_components(obj);
        
    end
    
end
