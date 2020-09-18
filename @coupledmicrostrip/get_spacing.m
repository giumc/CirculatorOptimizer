function ret=get_spacing(obj,varargin)

    if isempty(varargin)
        
        ret=obj.convert_mil_to_metre(obj.spacing);
        
    else
        
        if strcmp(varargin{1},'mil')
            
            ret=obj.spacing;
            
        else
            
            if strmp(varargin{1},'metre')
                
                ret=obj.convert_mil_to_metre(obj.spacing);
                
            end
            
        end
        
    end

end
