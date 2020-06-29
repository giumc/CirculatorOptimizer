classdef (Abstract) GetSetOptParam < handle
   
% interface to control OptParams
%
% ------ METHODS ------
%
% Abstract:
% opt_par = get_OptParam(obj);
% set_bounds(obj);
%
% Static:
% opt_par = set_OptParam_value(param,value);
% set_OptParam_min(param,min);
% set_OptParam_max(param,max);


    methods (Abstract)
        
        opt_par = get_OptParam(obj);
        set_bounds(obj);
        
    end
    
    methods (Access=protected)
       
        function val=get_opt_norm_values(obj)
            
            params=obj.get_OptParam;
            
            val=[];
            
            for i=1:length(params)
                
               val=[val params(i).normalize];
                
            end
            
        end
        
        function update_opt_norm_values(obj,vals)
            
            params=obj.get_OptParam;
            
            if ~length(vals)==length(params)
                
                error("N values to be updated is different than OptParam");
                
            end
            
            for i=1:length(params)
                
                params(i).set_value(params(i).denormalize(vals(i)));
                
            end
            
        end
        
        function update_bounds(obj)
        
            params=obj.get_OptParam;
            
            for i=1:length(params)
               
                params(i).rescale_bounds;
                
            end
            
        end
        
    end
    
    methods (Access=protected,Static)
        
        function set_OptParam_value(param,value,varargin)
           param.set_value(value,varargin{:})
        end
        
        function set_OptParam_min(param,min)
            param.set_min(min);
        end
        
        function set_OptParam_max(param,max)
            param.set_max(max);
        end

    end
    
end
