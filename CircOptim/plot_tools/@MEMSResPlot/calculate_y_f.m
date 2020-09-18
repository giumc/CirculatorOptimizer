function y_f=calculate_y_f(obj)

    freq=obj.f_test;
    y_f=[];
    
    for i=1:length(freq)
        
        y_f(i)=obj.opt_obj.y(freq(i));
        
    end
    
    y_f=y_f.';

end
