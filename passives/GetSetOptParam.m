classdef (Abstract) GetSetOptParam < handle
   
% interface to enable get/settability of opt_param
%
% ------ METHODS ------
%
% Abstract:
% opt_par = get_opt_param(obj);
%
% Static:
% opt_par = set_opt_param_value(param,value);
% set_opt_param_min(param,min);
% set_opt_param_max(param,max);


    methods (Abstract)
        
        opt_par = get_opt_param(obj);
        
    end
    
    methods (Static)
        
        function set_opt_param_value(param,value,varargin)
           param.set_value(value,varargin{:})
        end
        
        function set_opt_param_min(param,min)
            param.set_min(min);
        end
        
        function set_opt_param_max(param,max)
            param.set_max(max);
        end
        
    end
    
end
