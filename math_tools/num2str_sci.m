function [scaled_values,label,exp]=num2str_sci(values)
% num2str_sci (values)      -> return convert2sci + prefix + unit  
    label='';
    if mean(values)-1<1e-3
        scaled_values=0;
        label='';
        exp=0;
        return
    end
    
    if length(values)==1
        if values==0
            scaled_values=0;
            label='';
            exp=0;
            return
        end
    end
    
    exp=0;
    
    for i=-18:3:15 
        if mean(values)/10^(i) < 1e3 && mean(values)/10^(i) >= 1
            scaled_values    =   values./10^(i); 
            exp = i;
            switch i
                case -18
                    label   =   'z';
                    break;
                case -15
                    label   =   'f';
                    break;
                case -12
                    label   =   'p';
                    break;
                case -9
                    label   =   'n';
                    break;
                case -6
                    label   =   'u';
                    break;
                case -3
                    label   =   'm';
                    break;
                case 0
                    label   =   '';
                    break;
                case 3
                    label   =   'k';
                    break;
                case 6
                    label   =   'M';
                    break;
                case 9
                    label   =   'G';
                    break;
                case 12
                    label   =   'T';
                    break;
            end
            break;
        end
    end
        
end
