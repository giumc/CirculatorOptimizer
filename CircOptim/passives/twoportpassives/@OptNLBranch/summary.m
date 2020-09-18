function varargout=summary(obj)

    s=strcat('Passive Design :\n',...
        obj.passive.summary,...
        'Nonlinear Resonator :\n',...
        obj.nlres.summary);
    
    switch nargout 
        
        case 0 
            clc
            fprintf(s);
            
        case 1
            
            varargout{1}=s;
            
    end

end
