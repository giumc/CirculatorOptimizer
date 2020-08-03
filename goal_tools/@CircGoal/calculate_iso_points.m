function calculate_iso_points(obj)

    % iso frequencies
    f_points= [...
        obj.f_center*(1-obj.bandwidth/2),...
        obj.f_center*(1+obj.bandwidth/2)];
    
    bwbounds=find_indexes(f_points,obj.f_test);
    
    idx=bwbounds(1):bwbounds(2);
    
    lbw=bwbounds(2)-bwbounds(1);
    
    margin=floor(lbw/obj.edge_margin/2);
    
    idx(1:margin)=[];
    
    idx((end-margin):end)=[];
    
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
