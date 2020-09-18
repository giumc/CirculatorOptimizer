function set_width(obj,value,varargin)

    if isempty(varargin)
        
        obj.width=value;
        
    else
        
        if strcmp(varargin{1},'metre')
            
            obj.width=obj.convert_metre_to_mil(value);
            
        else
            
            if strcmp(varargin{1},'mil')
                
                obj.width=value;
                
            end
            
        end
        
    end

end
