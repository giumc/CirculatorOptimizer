classdef BPFilter < LPFilter
   
    properties (Access=private,Constant)
        
        def_fbw=0.1;
    end
    
    properties (SetAccess=protected)
       
        fractional_bw=BPFilter.def_fbw;
        
    end
    
    methods 
        
        function obj=BPFilter(coeffs,omega_c,fbw,z_term)
        
            obj@LPFilter(coeffs,omega_c,z_term);
            
            obj.set_fractional_bw(fbw);
            
        end
        
        function set_fractional_bw(obj,fbw)
        
            obj.fractional_bw=fbw;
            
            obj.set_components;
            
            obj.set_omega_axis;
            
        end
        
        function ret=get_fractional_bw(obj)
        
            ret=obj.fractional_bw;
            
        end
        
        ret=get_Z_coupled(obj);
        
        vararout=summary(obj);
        
    end
    
    methods (Access=protected)
        
        set_omega_axis(obj);
        
        set_components(obj);
        
        ret=get_inverter_Y(obj);
       
    end
    
end
