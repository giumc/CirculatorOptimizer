function calculate_tx_points(obj)

    margin=ceil(obj.fpoints/obj.edge_margin);
    
    %equispaced points in tx bandwidth
    
    f_points=linspace(...
        obj.f_center*(1-obj.bandwidth/2),...
        obj.f_center*(1+obj.bandwidth/2),...
        obj.order+2);
     
    %add center freq
    
    if isempty(f_points(f_points==obj.f_center))
        
        f_points(end+1)=obj.f_center;
        
        f_points=sort(f_points);
        
    end
    
    idx=find_indexes(f_points,obj.f_test);
    
    idx=[idx(1) idx(2):idx(end-1) idx(end)];
    
    tx_values = ones(1,length(idx)) ;
    
    tx_values([1,end])=1/sqrt(2);
    
    
    lowspan=1:margin;
    highspan=(obj.fpoints-margin):obj.fpoints;
    
    idx=[lowspan idx highspan];
    
    f_points=obj.f_test(idx);
    
    tx_values=[zeros(1,length(lowspan)),...
        tx_values,...
        zeros(1,length(highspan))];
    
    % set to object 
    if obj.direction==2
        
        obj.ILgoal.set_f_array(f_points);
    
        obj.ILgoal.set_goal(tx_values);
        
        obj.ILgoal.set_indexes(idx);
        
    else
        
        if obj.direction==1

            obj.ISOgoal.set_f_array(f_points);

            obj.ISOgoal.set_goal(tx_values);
            
            obj.ISOgoal.set_indexes(idx);
            
        else
            
            error("Invalid direction");
            
        end
        
    end
    
end
