classdef (Abstract) GetSetOptParam < handle
   
% interface to enable get/settability of opt_param
%
% ------ METHODS ------
%
% Abstract:
% opt_par = get_opt_param(obj);
% set_def_bounds(obj);
%
% Static:
% opt_par = set_opt_param_value(param,value);
% set_opt_param_min(param,min);
% set_opt_param_max(param,max);


    methods (Abstract)
        
        opt_par = get_opt_param(obj);
        set_def_bounds(obj);
        
    end
    
    methods
       
        function val=get_opt_norm_values(obj)
            
            params=obj.get_opt_param;
            
            val=[];
            
            for i=1:length(params)
                
               val=[val params(i).normalize];
                
            end
            
        end
        
        function update_opt_norm_values(obj,vals)
            
            params=obj.get_opt_param;
            
            if ~length(vals)==length(params)
                
                error("N values to be updated is different than opt_param");
                
            end
            
            for i=1:length(params)
                
                params(i).set_value(params(i).denormalize(vals(i)));
                
            end
            
        end
        
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
