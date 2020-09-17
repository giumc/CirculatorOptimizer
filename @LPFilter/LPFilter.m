classdef LPFilter < NormalizedFilter
   
    properties (Access=private,Constant)
        
        def_omega_c=1e3;
        def_z_term=10;
    
    end
    
    properties (SetAccess=protected)
       
        omega_c=LPFilter.def_omega_c;

        z_term=LPFilter.def_z_term;
        
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
            
            obj.set_omega_axis();
            
        end
        
        function set_z_term(obj,z_term)
        
            obj.z_term=z_term;
            
            obj.set_components();
        
        end
        
        function ret=get_omega_c(obj)
            
            ret=obj.omega_c;
            
        end
        
        function ret=get_z_term(obj)
        
            ret=obj.z_term;
        
        end
        
    end
    
    methods (Access=protected)
    
        set_components(obj);
        
        set_omega_axis(obj);
        
    end
    
end
