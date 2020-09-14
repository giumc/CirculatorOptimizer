classdef Microstrip < TwoPort
    
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
   
        def_length=1000;
        def_width=50;
        def_units='mil';
        def_thickness=62;
        def_epsilon_r=1;
        
    end
        
    properties (Access=protected)
        
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
        
        function ret=get_length(obj)
            
            ret=obj.length/1e3*2.54;
        
        end
        
        function ret=get_width(obj)
            
            ret=obj.width/1e3*2.54;
        
        end
        
        function ret=get_thickness(obj)
            
            ret=obj.thickness/1e3*2.54;
        
        end
        
        function ret=get_epsilon_r(obj)
            
            ret=obj.epsilon_r;
        
        end
        
        m=ABCD(obj,freq);
        
        ret=get_epsilon_eff(obj,varargin);
        
        ret=get_Z_line(obj,varargin);
        
        ret=get_prop_const(obj,freq,varargin);
        
    end
    
end
