function calculate_rl_points(obj)

    margin=ceil(obj.fpoints/obj.edge_margin);
    
    f_points=linspace(...
        obj.f_center*(1-obj.bandwidth/2),...
        obj.f_center*(1+obj.bandwidth/2),...
        obj.order+2);
    
    f_points([1 end])=[];
    
    idx=find_indexes(f_points,obj.f_test);
   
    idx=idx(1):idx(end);
       
    rl_values= zeros(1,length(idx));
    
    %add margin at end
    
    lowspan=1:margin;
    highspan=(obj.fpoints-margin):obj.fpoints;
    
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
