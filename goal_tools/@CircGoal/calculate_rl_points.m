function calculate_rl_points(c_goal)

%     equispaced points in rl bandwidth
%     
%     f_points=linspace(...
%         c_goal.f_center*(1-c_goal.tx_bandwidth/2),...
%         c_goal.f_center*(1+c_goal.tx_bandwidth/2),...
%         c_goal.order+2);
%      
%     add center freq
%     
%     if isempty(f_points(f_points==c_goal.f_center))
%         
%         f_points(end+1)=1;
%         
%         f_points=sort(f_points);
%         
%     end
%     
% evaluate rl
%     
%     rl_values = zeros(1,length(f_points)) ;
%     
    f_points=c_goal.f_center;
    
    rl_values= 0;
    
    
    %rl_values([1,end])=1/sqrt(2);
    
    % set to object 
    
    c_goal.RLgoal.set_f_array(f_points);
    
    c_goal.RLgoal.set_goal(rl_values);

end
