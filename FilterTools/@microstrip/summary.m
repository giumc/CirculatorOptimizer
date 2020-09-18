function varargout=summary(obj)

    %Microstrip implementation

    str="----- Microstrip Line ------\n\n";
    
    str=strcat(str,return_parameter("Width\t(mil)",obj.get_width('mil')));
    str=strcat(str,return_parameter("Thickness\t(mil)",obj.get_thickness('mil')));
    str=strcat(str,return_parameter("Length\t(mil)",obj.get_length('mil')));
    str=strcat(str,return_parameter("Epsilon R",obj.get_epsilon_r));
    str=strcat(str,return_parameter("ZLine\t(Ohm)",obj.get_Z_line));

    if nargout==0
        clc
        fprintf(str);
        
    else
        
        varargout{1}=str;
        
    end
    
    function str=return_parameter(name,value)
    
        str=sprintf("%s\t=\t%.3e\n\n",name,value);
    
    end
    
end
