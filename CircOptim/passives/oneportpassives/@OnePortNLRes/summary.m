function varargout=summary(obj)

    s=obj.var.summary;
    
    s=strcat(s,obj.summary@OnePortRes);

    switch nargout
        
        case 0
            clc
            fprintf(s);
            
        case 1
            
            varargout{1}=s;
            
    end
    
end
