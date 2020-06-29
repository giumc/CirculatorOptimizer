function clear_plot(obj)

    if ~isempty(obj.fig)

        if isvalid(obj.fig)
            close(obj.fig);
            delete(obj.fig);
        end

    end

end
