function ret=get_width(obj,varargin)

    if isempty(varargin)
        
        ret=obj.convert_mil_to_metre(obj.width);
        
    else
        
        if strcmp(varargin{1},'mil')
            
            ret=obj.width;
            
        else
            
            if strmp(varargin{1},'metre')
                
                ret=obj.convert_mil_to_metre(obj.width);
                
            end
            
        end
        
    end

end
