function varargout=summary(obj)


    % implementation for OptNLCap
    tbp={obj.mod_freq,obj.mod_depth,obj.mod_phase,obj.capacitance};
    
    s=obj.build_summary(tbp);
    
    switch nargout 
        
        case 0 
            clc
            fprintf(s);
            
        case 1
            
            varargout{1}=s;
            
    end
    
end
