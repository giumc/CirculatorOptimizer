function varargout=summary(obj)

    res=obj.resonators;
    s='';
    
    for i=1:length(res)
        
%         s=strcat(s,res(i).label,'\n');
        s=strcat(s,res(i).summary);
        
    end
    
    s=strcat(s,sprintf('Reference Load = %8.3\n',obj.ref_impedance));
    
    switch nargout 
        
        case 0 
            
            fprintf(s);
            
        case 1
            
            varargout{1}=s;
            
    end

end
