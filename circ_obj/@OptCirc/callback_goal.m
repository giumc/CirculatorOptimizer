function callback_goal(obj,~,~)
% 
%     obj.init_goal('order',obj.order,...
%         'bandwidth',obj.bandwidth,...
%         'f_center',obj.f_center,...
%         'direction',obj.direction);
        
    obj.init_branch('order',obj.order);

    obj.reset_circ;
        
    if ~isempty(obj.plot_tools)

        if ~strcmp(obj.plot_tools.type,"none")

            obj.plot_tools.reset_plot;

        end

    end

end
