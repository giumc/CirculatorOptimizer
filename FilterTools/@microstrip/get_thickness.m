function ret=get_thickness(obj,varargin)

    if isempty(varargin)
        
        ret=obj.convert_mil_to_metre(obj.thickness);
        
    else
        
        if strcmp(varargin{1},'mil')
            
            ret=obj.thickness;
            
        else
            
            if strcmp(varargin{1},'metre')
                
                ret=obj.convert_mil_to_metre(obj.thickness);
                
            end
            
        end
        
    end

end
