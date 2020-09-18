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
        
    properties (SetAccess=protected)

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
        
        set_width(obj,value,varargin);
        
        set_length(obj,value,varargin);
        
        set_thickness(obj,value,varargin);
        
        function ret=get_epsilon_r(obj)
            
            ret=obj.epsilon_r;
        
        end
        
        function set_epsilon_r(obj,value)
        
            obj.epsilon_r=value;
            
        end
        
        ret=get_length(obj,varargin);
        
        ret=get_width(obj,varargin);
        
        ret=get_thickness(obj,varargin);

        m=ABCD(obj,freq);
        
        ret=get_epsilon_eff(obj);
        
        ret=get_Z_line(obj);
        
        ret=get_prop_const(obj,freq,varargin);
        
        varargout=summary(obj);
        
    end
    
end
