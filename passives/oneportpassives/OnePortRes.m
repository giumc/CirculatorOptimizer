classdef  OnePortRes < OnePortPassive
%     
% interface for one port resonators
% member of OnePortPassive
% 
% ------ PROPERTIES ------
%     
% Set-Access protected:
% f_center (opt_param)
% q_loaded (opt_param)
% q_unloaded (opt_param)
% label (string)
% ref_impedance (double)
% 
% ------ METHODS ------
% 
% Public:
% OnePortRes(varargin)        -> pass {NAME,VALUE} to set values
%                                 NAMES:'f_center','q_loaded','q_unloaded'
% 
% get_opt_param()           ->  returns optimizable opt_param
% Abstract:
% c()                         -> members have to define l , c, r
% l()
% r()

   
    properties (SetAccess=protected)
       
       f_center opt_param = opt_param('value',1);
       
       q_loaded opt_param = opt_param('value',5);
       
       q_unloaded opt_param = opt_param('value',1e3);
       
       label string;
       
       ref_impedance double = 50;
       
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
        
        function opt_par=get_opt_param(obj)
            
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
        
    end
    
    methods (Abstract)
        
        ind=l(obj);
        cap=c(obj);
        res=r(obj);

    end

        
                
end
