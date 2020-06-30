function set_min(obj,min,varargin)

    if ~isempty(varargin)
        
        if strcmp(varargin{:},'override')
            
            if min < obj.global_min
                
                obj.min=obj.global_min;
                
            else
                
                obj.min=min;
                
                return
                
            end
        
        end
        
    end
        
    max=obj.max;
    
    v=obj.value;

    %prevent weird cases

    if min > max
        
        obj.max=min;
        
        obj.value=min;
        
    end

    %adjust 
    
    if v < min 
        
        obj.value=min;
        
        obj.min=max([min obj.global_min]);
        
    else
        
        obj.min=max([min obj.global_min]);
        
    end
 
end
