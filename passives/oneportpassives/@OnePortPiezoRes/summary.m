function varargout=summary(obj)

    tbp=[obj.f_center,obj.kt2,obj.q_unloaded,obj.z_match];
    
    s=strcat(obj.label,'\n');
    
    s=strcat(s,obj.build_summary(tbp));
    
    switch nargout
        
        case 0 
         
            fprintf(s);
            
        case 1
            
            varargout{1}=s;
            
    end

end
