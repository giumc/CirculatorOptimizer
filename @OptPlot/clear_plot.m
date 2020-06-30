function clear_plot(obj)

    if ~isempty(obj.fig) || obj.find_plot

        if isvalid(obj.fig)
            
            delete(obj.fig.Children);
            
        end
        
    end

end
