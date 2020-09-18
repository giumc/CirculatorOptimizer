function varargout=summary(obj)

    %CoupledMicrostrip implementation

    str="-----Coupled Microstrip Line ------\n\n";
    
    str=strcat(str,return_parameter("Width\t(mil)",obj.get_width('mil')));
    str=strcat(str,return_parameter("Thickness(mil)",obj.get_thickness('mil')));
    str=strcat(str,return_parameter("Length\t(mil)",obj.get_length('mil')));
    str=strcat(str,return_parameter("Epsilon R\t",obj.get_epsilon_r));
    str=strcat(str,return_parameter("ZLine\t(Ohm)",obj.get_Z_line));
    
    str=strcat(str,return_parameter("Z_even\t(Ohm)",obj.get_Z_even));
    str=strcat(str,return_parameter("Z_odd\t(Ohm)",obj.get_Z_odd));
    
    str=strcat(str,'\n');
    if nargout==0
        clc
        fprintf(str);
        
    else
        
        varargout{1}=str;
        
    end
    
    function str=return_parameter(name,value)
    
        str=sprintf("%s\t=\t%.3f\n",name,value);
    
    end
    
end
