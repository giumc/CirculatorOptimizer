function calculate_iso_points(c_goal)

    % iso frequencies

    if c_goal.order==1

        f_points=c_goal.f_center;
        
    else

        f_points=linspace(...
            c_goal.f_center*(1-c_goal.iso_bandwidth/2),...
            c_goal.f_center*(1+c_goal.iso_bandwidth/2),...
            c_goal.order+2);
        
        if isempty(f_points(f_points==c_goal.f_center))
           
            f_points=[f_points,c_goal];
            
            f_points=sort(f_points);
            
        end
        
    end
    
    % iso values
    
    iso_values=zeros(1,length(f_points));
    
    % set to object 
    
    c_goal.ISOgoal.set_f_array(f_points);

    c_goal.ISOgoal.set_goal(iso_values);

end
