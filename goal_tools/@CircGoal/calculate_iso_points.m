function calculate_iso_points(obj)

    % iso frequencies
    
    f_points=linspace(...
        obj.f_center*(1-obj.bandwidth/2),...
        obj.f_center*(1+obj.bandwidth/2),...
        obj.order+2);
     
    if obj.order>1
        
%         f_points([1,end])=[];
        
        idx= find_indexes(f_points,obj.f_test);
    
        idx= idx(1):idx(end);
        
    else
        
        f_points([1,end])=[];
        
        idx= find_indexes(f_points,obj.f_test);
        
    end
    
    f_points=obj.f_test(idx);
    
    iso_values=zeros(1,length(f_points));
    
    % set to object 
    
    if obj.direction==2
        
        obj.ISOgoal.set_f_array(f_points);
        
        obj.ISOgoal.set_indexes(idx);
        
        obj.ISOgoal.set_goal(iso_values);
        
    else
        
        if obj.direction==1

            obj.ILgoal.set_f_array(f_points);
            
            obj.ILgoal.set_indexes(idx);

            obj.ILgoal.set_goal(iso_values);
            
        else
            
            error("Invalid direction");
            
        end
        
    end
    
    
    

end
