function calculate_tx_points(obj)

    %equispaced points in tx bandwidth
    
    f_points=linspace(...
        obj.f_center*(1-obj.tx_bandwidth/2),...
        obj.f_center*(1+obj.tx_bandwidth/2),...
        obj.order+2);
     
    %add center freq
    
    if isempty(f_points(f_points==obj.f_center))
        
        f_points(end+1)=obj.f_center;
        
        f_points=sort(f_points);
        
    end
             
    % evaluate IL
    
    tx_values = ones(1,length(f_points)) ;
    
    tx_values([1,end])=1/sqrt(2);
    
    % set to object 
    
    obj.ILgoal.set_f_array(f_points);
    
    obj.ILgoal.set_goal(tx_values);
    
end
