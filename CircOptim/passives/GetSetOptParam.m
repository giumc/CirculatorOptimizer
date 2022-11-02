classdef (Abstract) GetSetOptParam < handle
   
% interface to control OptParams
%
% ------ METHODS ------
%
% Abstract :
% opt_par = get_OptParam(obj);      (return all optimizable params)
% 
% Public :
%
%   val=get_opt_norm_values(obj)
%   update_opt_norm_values(obj,vals)
%   update_bounds(obj)
%

    methods (Abstract)
        
        opt_par = get_OptParam(obj);
        
    end
    
    methods
       
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
       
        function s=build_summary(tbp)
            
            s='';
            
            if isvector(tbp) && (~iscell(tbp))

                for i=1:length(tbp)

                    s=strcat(s,tbp(i).summary);

                end
                
            else
                
                if iscell(tbp)

                    for i=1:length(tbp)

                        s=strcat(s,tbp{i}.summary);

                    end

                end
                
            end
               
        end
        
        function varargout=summary_parameter(label,value)
        
            s=strcat(...
                sprintf('%10s \t =\t %8.2e',pad(label,12),value),...
                '\n');
            
            switch nargout
                
                case 0
                    
                    fprintf(s);
                    
                case 1
                    
                    varargout{1}=s;
                    
            end
        
        end
        
    end
    
end
