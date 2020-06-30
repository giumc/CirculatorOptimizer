function set_max(obj,max,varargin)
%callback function, triggered when one attempts to modify boundaries
    
    if ~isempty(varargin)

        if strcmp(varargin{:},'override')

            if max > obj.global_max

                obj.max=obj.global_max;

            else

                obj.max=max;

                return

            end

        end

    end

    min=obj.min;
    
    v=obj.value;

    %prevent weird cases
    if max < min
        
        obj.min=max;
        
        obj.value=max;
        
    end

    if max > obj.global_max
        
        obj.max=obj.global_max;
        
    end

    %adjust

    if v > max
        
        obj.value=max;
        
        obj.max=min([max obj.global_max]);
        
    else
        
        obj.max=min([max obj.global_max]);
        
    end
    
end
