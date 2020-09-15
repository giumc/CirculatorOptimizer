function varargout=summary(obj)

    % implementation for ONePOrtRes
    tbp=[obj.f_center,obj.q_loaded,obj.q_unloaded];
    
    s=obj.build_summary(tbp);

    s=strcat(s,obj.summary_parameter('Ref.Load',obj.ref_impedance));
    
    switch nargout 
        
        case 0
            clc
            fprintf(s)  ;
            
        case 1
            
            varargout{1}=s;
            
    end
    
end
