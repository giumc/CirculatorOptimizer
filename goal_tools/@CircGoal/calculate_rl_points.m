function calculate_rl_points(obj)

    f_points=linspace(...
        obj.f_center*(1-obj.bandwidth/2),...
        obj.f_center*(1+obj.bandwidth/2),...
        obj.order+2);
    
    f_points([1 end])=[];
    
    idx=find_indexes(f_points,obj.f_test);
   
    idx=ceil(linspace(min(idx),max(idx),5));
    
    f_points=obj.f_test(idx);
       
    rl_values= zeros(1,length(f_points));
    
    %rl_values([1,end])=1-1/sqrt(2);
    
    obj.RLgoal.set_f_array(f_points);
    
    obj.RLgoal.set_goal(rl_values);

    obj.RLgoal.set_indexes(idx);
    
end
