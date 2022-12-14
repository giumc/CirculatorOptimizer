classdef CoupledMicrostrip < Microstrip
    
    properties (Access=private,Constant)
        
        def_spacing=20;
        
    end
    
    properties (SetAccess=protected)
        
        spacing=CoupledMicrostrip.def_spacing;
        
    end
    
    methods % constructors
        
        function obj=CoupledMicrostrip(varargin)
        
            obj.init_coupledmicrostrip(varargin{:});
        
        end
        
    end
    
    methods (Access=protected)
        
        init_coupledmicrostrip(obj,varargin);
        
        p=get_p(obj,freq);
        
        f=get_norm_freq(obj,freq);
        
        q=get_q(obj,freq);
        
    end
        
    methods%get/set properties
        
        ret=get_Z_odd(obj,freq);
        
        ret=get_Z_even(obj,freq);
        
        ret=get_epsilon_even(obj,freq);
        
        ret=get_epsilon_odd(obj,freq);
        
        set_spacing(obj,value,varargin);
        
        ret=get_spacing(obj,varargin);
        
        m=ABCD(obj,freq);
        
        beta=get_prop_const(obj,varargin);
        
        ret=get_Z_coupledline(obj);
        
        [w,s]=solve_for_Z(obj,Z_e,Z_o,freq,varargin);
        
        l=solve_for_lambda4(obj,freq,varargin);
        
        varargout=summary(obj);
        
        ret=get_param_table(obj);
    end
    
end
