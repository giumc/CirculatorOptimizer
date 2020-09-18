function clear_plot(obj)

    if ~isempty(obj.fig) || obj.find_plot

        if isvalid(obj.fig)
            
            delete(obj.fig.Children);
            
        end
        
    end
    
%     if ~isempty(obj.OptParamGraphics)
%         
%         for i=1:length(obj.OptParamGraphics(1,:))
%             
%             for j=1:length(obj.OptParamGraphics(:,1))
%                 
%                 if isvalid(obj.OptParamGraphics(i,j))
% 
%                     delete(obj.OptParamGraphics(i,j));
% 
%                 end
%                 
%             end
%             
%         end
%         
%     end

end
