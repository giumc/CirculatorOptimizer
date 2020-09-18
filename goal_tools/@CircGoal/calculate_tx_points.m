function calculate_tx_points(obj)

    % implementation for CircGoal
    f_points= [...
        obj.f_center*(1-obj.bandwidth/2),...
        obj.f_center*(1+obj.bandwidth/2)];
    
    bwbounds=find_indexes(f_points,obj.f_test);
    
    idx=bwbounds(1):bwbounds(2);
    lbw=bwbounds(2)-bwbounds(1);
    
    margin=floor(lbw/obj.edge_margin/2);
    
    idx(2:margin)=[];
    
    idx(end-margin:end-1)=[];
    
    tx_values = ones(1,length(idx)) ;
    
    tx_values([1,end])=1/sqrt(2);
    
    lobw=idx(1);
    
    highbw=obj.fpoints-idx(end);
    
    margin=floor(lobw/obj.edge_margin);
    
    lowspan=1:(highbw-margin);
    
    margin=ceil(highbw/obj.edge_margin);
    
    highspan=(idx(end)+margin):obj.fpoints;
    
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
