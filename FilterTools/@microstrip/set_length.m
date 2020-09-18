function set_length(obj,value,varargin)

    if isempty(varargin)
        
        obj.length=value;
        
    else
        
        if strcmp(varargin{1},'metre')
            
            obj.length=obj.convert_metre_to_mil(value);
            
        else
            
            if strcmp(varargin{1},'mil')
                
                obj.length=value;
                
            end
            
        end
        
    end

end
