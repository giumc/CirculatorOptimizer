function varargout=summary(obj)

    str=obj.summary@BPFilter;
    
    cpl=obj.get_coupledlines;
    
    for i=1:length(cpl)
        
        str=strcat(str,cpl(i).summary);
        
    end
    
    if nargout==0
        
        clc
        fprintf(str)
        
    else
        
        varargout{1}=str;
        
    end

end
