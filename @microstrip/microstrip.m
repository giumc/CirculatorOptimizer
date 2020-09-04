classdef Microstrip < handle
    
%     handle class for Microstrip object
%     
%     properties :
%     
%         width
%         length
%         thickness
%         epsilon_r
% 
%     methods :
%         
%         set_width(value)
%         set_length(value)
%         set_thickness(value)
%         set_epsilon_r(value)
%         
%         get_epsilon_eff()
%         get_Z_line()
%         
       
    properties (Constant,Access=protected)
        
        epsilon_0=8.85418e-12;
        
        c_0=299.7e6;
        
        def_length=1000;
        def_width=50;
        def_units='mil';
        def_thickness=62;
        def_epsilon_r=1;
        
    end
        
    properties (SetAccess=protected)
        
        units='mil';
        
        width;
        
        length;
        
        thickness;
        
        epsilon_r;
        
    end
    
    methods
        
        function obj=Microstrip(varargin)

            init_microstrip(obj,varargin{:}); 
 
        end
        
    end
    
    methods (Access=protected)
       
        init_microstrip(microstrip,varargin);
        
    end
    
    methods %set/get properties
        
        function set_width(obj,value)
            
            obj.width=value;
            
        end
        
        function set_length(obj,value)
        
            obj.length=value;
        
        end
        
        function set_thickness(obj,value)
        
            obj.thickness=value;
        
        end
        
        function set_epsilon_r(obj,value)
        
            obj.epsilon_r=value;
            
        end
        
        ret=get_epsilon_eff(obj);
        
        ret=get_Z_line(obj);
        
    end
    
    
end
