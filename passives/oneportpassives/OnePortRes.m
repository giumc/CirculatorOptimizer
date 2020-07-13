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
    properties (Access=private,Constant)
        
       def_f_c=1;
       def_q_l=5;
       def_q_u=1e9;
       def_r_term=50;
       
       def_f_rescale=0.1;
       def_q_rescale=0.5;
       
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
               
    end
    
    methods (Access=protected)
        
        function init_resonator(obj,varargin)
        
            obj.f_center=OptParam('value',OnePortRes.def_f_c);
            
            obj.q_loaded=OptParam('value',OnePortRes.def_q_l);
            
            obj.q_unloaded=OptParam('value',OnePortRes.def_q_u);
            
            obj.f_center.rescale_factor=obj.def_f_rescale;
            
            obj.q_loaded.rescale_factor=obj.def_q_rescale;
            
             if ~isempty(varargin)
                
                for i=1:length(varargin)
                    
                    if ischar(varargin{i})||isstring(varargin{i})
                        
                        switch varargin{i}
                            
                            case {'f','f_center','f_c'}
                                
                                obj.f_center.set_value(varargin{i+1},'override');
                            
                            case {'q','q_ref','q_l','q_loaded'}
                                
                                obj.q_loaded.set_value(varargin{i+1},'override');
                            
                            case {'q_u','qu','q_unloaded'}
                                
                                obj.q_unloaded.set_value(varargin{i+1},'override');
                                
                        end
                        
                    end
                    
                end
                
            end % set values as Name Value pair
        
        end
        
        function update_label(obj,~,~)
            
            obj.set_default_labels;
            obj.f_center.label=strcat(obj.f_center.label,"_",obj.label);
            obj.q_loaded.label=strcat(obj.q_loaded.label,"_",obj.label);
            obj.q_unloaded.label=strcat(obj.q_loaded.label,"_",obj.label);
        
        end
        
        function set_default_labels(obj)
        
            obj.f_center.unit='Hz';

            obj.f_center.label='Fc';

            obj.q_loaded.unit='';

            obj.q_loaded.label='Ql';

            obj.q_unloaded.unit='';

            obj.q_unloaded.label='Qu';
        
        end
        
    end
    
    methods (Abstract)
        
        ind=l(obj);
        cap=c(obj);
        res=r(obj);

    end
             
end
