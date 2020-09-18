function varargout=summary(obj)

    res=obj.resonators;
    s='';
    
    for i=1:length(res)
        
%         s=strcat(s,res(i).label,'\n');
        s=strcat(s,res(i).summary);
        
    end
    
    s=strcat(s,sprintf('%10s \t =\t %8.2e',pad('Ref.Load',12), obj.ref_impedance),...
        '\n\n');
    
    switch nargout 
        
        case 0 
            
            fprintf(s);
            
        case 1
            
            varargout{1}=s;
            
    end

end
