function err=fine_error_function(obj,varargin)

    err=obj.error_function(varargin{:});

    f_test=obj.f_test;
    
    if obj.direction==2
        
        f_goal=obj.ILgoal.f_array;
        goal=obj.ILgoal.goal;
        IL=abs(squeeze(obj.s_f(2,1,:)));

    else
        
        if obj.direction==1
            
            f_goal=obj.ILgoal.f_array;
            goal=obj.ILgoal.goal;
            IL=abs(squeeze(obj.s_f(1,2,:)));
            
        end
        
    end
    
    idx_start=find_indexes(f_goal(1),f_test);
    
    idx_stop=find_indexes(f_goal(end),f_test);
    
    %3dB threshold
    
    err1=0;
    nerr=0;
    for i=[1:idx_start idx_stop:length(f_test)]
        
        if IL(i)>goal(1)
            
            nerr=nerr+1;
            
            err1=err1+abs(IL(i)-1/sqrt(2));
            
        end
        
    end
    
    err1=err1/nerr;
    
    %check slope
    
    err2=0;
    nerr=0;
    for i=[1:idx_start-1 idx_stop:(length(f_test)-1)]
        
        if IL(i+1)>=IL(i)
            
            nerr=nerr+1;
            
            err2=err2+abs(IL(i+1));
            
        end
        
    end
    
    err2=err2/nerr;
    
    err=err+(err1+err2)/2;
        
end
