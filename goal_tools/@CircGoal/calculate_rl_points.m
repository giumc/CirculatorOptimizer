function calculate_rl_points(obj)

    
    f_points= [...
        obj.f_center*(1-obj.bandwidth/2),...
        obj.f_center*(1+obj.bandwidth/2)];
    
    bwbounds=find_indexes(f_points,obj.f_test);
    
    idx=bwbounds(1):bwbounds(2);
    
    lbw=bwbounds(2)-bwbounds(1);
    
    margin=floor(lbw/obj.edge_margin/2);
    
    idx(1:margin)=[];
    
    idx(end-margin:end)=[];
       
    rl_values= zeros(1,length(idx));
    
    %add margin at end
    
    lobw=bwbounds(1);
    
    margin=floor(lobw/obj.edge_margin);
    
    lowspan=1:(bwbounds(1)-margin);
    
    highbw=obj.fpoints-bwbounds(2);
    
    margin=floor(highbw/obj.edge_margin);
    
    highspan=(bwbounds(2)+margin):obj.fpoints;
    
    idx=[lowspan idx highspan];
    
    f_points=obj.f_test(idx);
    
    rl_values=[ones(1,length(lowspan)),...
        rl_values,...
        ones(1,length(highspan))];
    
    %rl_values([1,end])=1-1/sqrt(2);
    
    obj.RLgoal.set_f_array(f_points);
    
    obj.RLgoal.set_goal(rl_values);

    obj.RLgoal.set_indexes(idx);
    
end
