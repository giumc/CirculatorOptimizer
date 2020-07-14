function calculate_iso_points(obj)

    % iso frequencies
    iso_bw=obj.bandwidth;

    f_points=[
        obj.f_center*(1-iso_bw/2),...
        obj.f_center*(1+iso_bw/2)];

    idx= find_indexes(f_points,obj.f_test);
    
    idx= idx(1):floor(obj.fpoints/10):idx(2);
    
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
