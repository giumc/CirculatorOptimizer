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
       def_q_u=1e3;
       def_r_term=50;
       
    end
   
    properties (SetAccess=protected)
       
       f_center OptParam = OptParam('value',OnePortRes.def_f_c);
       
       q_loaded OptParam = OptParam('value',OnePortRes.def_q_l);
       
       q_unloaded OptParam = OptParam('value',OnePortRes.def_q_u);
       
       label string;
       
       ref_impedance double = OnePortRes.def_r_term;
       
    end
        
    methods

        function obj=OnePortRes(varargin)
            
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
            
            obj.f_center.unit='Hertz';
            
            obj.f_center.label='F_c';
            
            obj.q_loaded.unit='';
            
            obj.q_loaded.label='Q_L';
            
            obj.q_unloaded.unit='';
            
            obj.q_unloaded.label='Q_U';
                       
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
        
        function set_bounds(obj)
            
            obj.f_center.rescale_bounds;
            obj.q_loaded.rescale_bounds;
            obj.q_unloaded.rescale_bounds;
            
        end
        
    end
    
    methods (Abstract)
        
        ind=l(obj);
        cap=c(obj);
        res=r(obj);

    end
             
end
