classdef CoupledMicrostrip < Microstrip
    
    properties
        
        spacing=10;
        
    end
    
    methods % constructors
        
        function obj=CoupledMicrostrip(varargin)
        
            obj.init_coupledmicrostrip(varargin{:});
        
        end
        
    end
    
    methods (Access=protected)
        
        init_coupledmicrostrip(obj,varargin);
        
    end
        
    methods %get/set properties
        
        ret=get_Z_odd(obj);
        
        ret=get_Z_even(obj);
        
        ret=get_epsilon_even(obj);
        
        ret=get_epsilon_odd(obj);
        
        function set_spacing(obj,value)
        
            obj.spacing=value;
            
        end
        
    end
    
end
