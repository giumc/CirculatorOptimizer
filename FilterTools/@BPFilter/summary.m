function varargout=summary(obj)

    %BPFilter implementation
    
    str=obj.summary@LPFilter;
    
    elems=obj.get_components;
    
    for i=1:length(elems)
        
        switch class(elems(i))
            
            case "OptSeriesRes"
                
                str=strcat(str,sprintf("------Series Resonator  (%d)-----\n",i-1));
                str=resonator_print(str,elems(i),i-1);
                
            case "OptParalRes"
                
                str=strcat(str,sprintf("------Parallel Resonator(%d)-----\n",i-1));
                str=resonator_print(str,elems(i),i-1);
                
        end
        
    end
    
    if nargout>0
        
        varargout{1}=str;
        
    else
        
        clc;
        fprintf(str);
        
    end
    
    function strout=resonator_print(strin,el,k)
    
        strin=strcat(strin,sprintf("L%d\t=\t%.3e\n",k,el.l));
        
        strout=strcat(strin,sprintf("C%d\t=\t%.3e\n\n",k,el.c));
    
    end
    

end
