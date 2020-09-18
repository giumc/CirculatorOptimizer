function set_thickness(obj,value,varargin)

    if isempty(varargin)
        
        obj.thickness=value;
        
    else
        
        if strcmp(varargin{1},'metre')
            
            obj.thickness=obj.convert_metre_to_mil(value);
            
        else
            
            if strcmp(varargin{1},'mil')
                
                obj.thickness=value;
                
            end
            
        end
        
    end

end
