classdef  OnePortRes < OnePortPassive
%     
% interface for one port resonators
% member of OnePortPassive
% 
% ------ PROPERTIES ------
%     
% Private,Constant:
% def_f_c = 1
% def_q_l = 5
% def_q_u = 1000
% def_r_term = 50
% 
% Set-Access protected:
% f_center (OptParam)
% q_loaded (OptParam)
% q_unloaded (OptParam)
% label (string)
% ref_impedance (double)
% 
% ------ METHODS ------
% 
% Public:
% OnePortRes(varargin)        -> pass {NAME,VALUE} to set values
%                                 NAMES:'f_center','q_loaded','q_unloaded'
% 
% get_OptParam()           ->  returns optimizable OptParams
% set_def_bounds()          -> set default boundaries
% Abstract:
% c()                         -> members have to define l , c, r
% l()
% r()

    properties (Access=protected,Constant)
        
       def_f_c=1;
       def_q_l=5;
       def_q_u=1e6;
       def_r_term=50;
       
       def_f_rescale=0.05;
       def_q_rescale=0.4;
       
    end
    
    properties (SetObservable,AbortSet)
        
       label string;
       
    end
   
    properties (SetAccess=protected)
       
       f_center OptParam ;
       
       q_loaded OptParam ;
       
       q_unloaded OptParam ;
       
       ref_impedance double = OnePortRes.def_r_term;
       
    end
        
    methods

        function obj=OnePortRes(varargin)
            
            obj.init_resonator(varargin{:});

            obj.set_default_labels();
            
            addlistener(obj,'label','PostSet',@obj.update_label);
                       
        end
        
        function opt_par=get_OptParam(obj)
            
            opt_par=[];
            if obj.f_center.optimizable
                
                opt_par=[opt_par ...
                    obj.f_center];
            end
            
            if obj.q_loaded.optimizable
                opt_par=[opt_par ...
                    obj.q_loaded];
            end
            
            if obj.q_unloaded.optimizable
                opt_par=[opt_par ...
                    obj.q_unloaded];
            end
            
        end
        
        function set_ref_impedance(obj,value)
        
            obj.ref_impedance = value;
        
        end
         
        varargout=summary(obj);
        
    end
    
    methods (Access=protected)
        
        init_resonator(obj,varargin);
        
        function update_label(obj,~,~)
            
            obj.set_default_labels;
            obj.f_center.label=strcat(obj.f_center.label,"_",obj.label);
            obj.q_loaded.label=strcat(obj.q_loaded.label,"_",obj.label);
            obj.q_unloaded.label=strcat(obj.q_unloaded.label,"_",obj.label);
        
        end
        
        set_default_labels(obj);
        
    end
    
    methods (Abstract)
        
        ind=l(obj);
        cap=c(obj);
        res=r(obj);
        
        ret=get_normalized_param(obj,fc,fbw);

    end
             
end
