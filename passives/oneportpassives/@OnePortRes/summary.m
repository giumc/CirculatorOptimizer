function varargout=summary(obj)

    % implementation for ONePOrtRes
    tbp=[obj.f_center,obj.q_loaded,obj.q_unloaded];
    
    s=obj.build_summary(tbp);

    s=strcat(s,sprintf('%10s \t =\t %8.2e',pad('Ref.Load',12), obj.ref_impedance),...
        '\n\n');
    
    switch nargout 
        
        case 0
            clc
            fprintf(s)  ;
            
        case 1
            
            varargout{1}=s;
            
    end
    
end
