function varargout=summary(obj)


    % implementation for OptNLCap
    tbp=[obj.mod_freq,obj.mod_depth,obj.mod_phase,obj.capacitance];
    
    s='';
    
    for i=1:length(tbp)
        
        s=strcat(s,tobeprinted(i).summary);
        
    end
    
    switch nargout 
        
        case 0 
            
            fprintf(s);
            
        case 1
            
            varargout{1}=s;
            
    end
    
end
