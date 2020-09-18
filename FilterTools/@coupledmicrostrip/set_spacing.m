function set_spacing(obj,value,varargin)

    if isempty(varargin)
        
        obj.spacing=value;
        
    else
        
        if strcmp(varargin{1},'metre')
            
            obj.spacing=obj.convert_metre_to_mil(value);
            
        else
            
            if strcmp(varargin{1},'mil')
                
                obj.spacing=value;
                
            end
            
        end
        
    end

end
