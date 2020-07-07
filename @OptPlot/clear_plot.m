function clear_plot(obj)

    if ~isempty(obj.fig) || obj.find_plot

        if isvalid(obj.fig)
            
            delete(obj.fig.Children);
            
        end
        
    end
    
    if ~isempty(obj.OptParamGraphics)
        
        for i=1:length(obj.OptParamGraphics)
            
            if isvalid(obj.OptParamGraphics(i))
                
                delete(obj.OptParamGraphics(i));
                
            end
            
        end
        
    end

end
