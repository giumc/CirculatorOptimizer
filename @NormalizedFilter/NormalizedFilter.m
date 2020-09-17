classdef NormalizedFilter < handle
    
    properties (Access=protected)
        
        omega_axis=(0.01:0.01:3);
        domega_axis=0.01;
        
    end
    
    properties (SetAccess=protected)
        
        coeffs;
        
    end
    
    properties (Access=protected)
       
        components;
        
    end
    
    methods 
        
        function obj=NormalizedFilter(coeffs)
        
            obj.set_coeffs(coeffs);
            
        end
        
        function ret=get_coeffs(obj)
        
            ret=obj.coeffs;
            
        end
        
        function set_coeffs(obj,coeffs)
                
            obj.coeffs=coeffs;
            obj.set_components();
            
        end

        plot_S21(obj,varargin);
        
        function ret=get_components(obj)
            
            ret=obj.components;
            
        end
        
    end
    
    methods (Access=protected)
        
        set_components(obj);
        
        ret=get_S21(obj,freq);
        
    end
    
end
