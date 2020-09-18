function stop   =     out_optim (obj, newvals,~,state)

    stop=obj.optimsetup.stop;
%     
%     tobedeactivated=[1 2 3 5 6 7 8]; %to deactivate buttons
% 
%     if strcmp(state,'init')
% 
%         if ~isempty(obj.optim_checkbox)
%             if isvalid(obj.optim_checkbox)
%                 for i=1:length(tobedeactivated)
% 
%                     obj.action_buttons(tobedeactivated(i)).Enable='off'; 
% 
%                 end
%                 obj.action_buttons(4).Enable='on';  %enable stop button
%             end
%         end
% 
%         if ~isempty(obj.boundaries_edit)
%             if isvalid([obj.boundaries_edit{:}])
%                 for i=1:length(obj.boundaries_edit)
% 
%                     edits=[obj.boundaries_edit{i}];
%                     edits(1).Enable='off';
%                     edits(2).Enable='off';
% 
%                 end
%             end
%         end
% 
%         if ~isempty(obj.boundaries_bars)
%             if isvalid(obj.boundaries_bars)
%                 for i=1:length(obj.boundaries_bars)
% 
%                     bar=obj.boundaries_bars(i);
%                     bar.Enable='off';
% 
%                 end
%             end
%         end
%         
%         if ~isempty(obj.optim_checkbox)
%             if isvalid(obj.optim_checkbox)
%                 for i=1:length(obj.optim_checkbox)
% 
%                     c=obj.optim_checkbox(i);
%                     c.Enable='off';
%                 end
%             end
%         end
%         
%     end

    if stop==true
        
        obj.optimizer_setup.stop=false;
        
%         if ~isempty(obj.action_buttons)
%         
%             if isvalid(obj.action_buttons)
% 
%                 obj.action_buttons(4).Enable='off';
%                 obj.action_buttons(3).Enable='on';
%             end
%         end
    end

    if strcmp(state,'iter')

        obj.update_opt_norm_values(newvals);
        
        obj.plot_tools.update_plot;
        
    end

    if strcmp(state,'done')||stop==true
        
%         if ~isempty(obj.boundaries_edit)
%             if isvalid([obj.boundaries_edit{:}])
%                 for i=1:length(obj.boundaries_edit)
%                     edits=[obj.boundaries_edit{i}];
%                     edits(1).Enable='on';
%                     edits(2).Enable='on';
%                 end
%             end
%         end
        
%         if ~isempty(obj.boundaries_bars)
%             if isvalid(obj.boundaries_bars)
%                 for i=1:length(obj.boundaries_bars)
%                     bar=obj.boundaries_bars(i);
%                     bar.Enable='on';
%                 end
%             end
%         end
%         
%         if ~isempty(obj.optim_checkbox)
%             if isvalid(obj.optim_checkbox)
%                 for i=1:length(obj.optim_checkbox)
%                     c=obj.optim_checkbox(i);
%                     c.Enable='on';
%                 end
%             end
%         end
%         
%         if ~isempty(obj.optim_checkbox)
%             if isvalid(obj.optim_checkbox)
%                 for i=1:length(tobedeactivated)
%                     obj.action_buttons(tobedeactivated(i)).Enable='on'; 
%                 end
%                 obj.action_buttons(4).Enable='off';  %disable stop button
%             end
%         end
        
    end
    
end
