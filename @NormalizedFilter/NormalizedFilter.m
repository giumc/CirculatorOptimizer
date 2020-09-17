classdef NormalizedFilter < handle
    
    properties (Access=private,Constant)
        
        omega_axis=[0.01:0.01:3];
        domega_axis=0.01;
        
    end
    
    properties (Access=protected)
        
        coeffs;
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
                
            obj.coeffs=[1 coeffs];
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
