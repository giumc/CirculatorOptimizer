function varargout=summary(obj)

    %NormalizedFilter implementation
    
    coeffs= obj.get_coeffs;
    
    elems = obj.get_components;
    
    str="------Normalized Coefficients------\n";
    
    str=strcat(str,sprintf("%.3f\t",coeffs));
    
    str=strcat(str,"\n\n");
    
    for i=1:length(elems)
        
        if strcmp(class(elems(i)),{"OptResistor";"OptCap";"OptInd"})
            
            str=strcat(str,elems(i).summary);
            
        end
        
    end
    
    if nargout>0
        
        varargout{1}=str;
        
    else
        
        clc;
        fprintf(str);
        
    end
    
end
