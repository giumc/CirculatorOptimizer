function ret=get_length(obj,varargin)

    if isempty(varargin)
        
        ret=obj.convert_mil_to_metre(obj.length);
        
    else
        
        if strcmp(varargin{1},'mil')
            
            ret=obj.length;
            
        else
            
            if strcmp(varargin{1},'metre')
                
                ret=obj.convert_mil_to_metre(obj.length);
                
            end
            
        end
        
    end

end
