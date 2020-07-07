function update_plot(obj)
    
    d=obj.generate_plot_data;
    
    ax= obj.ax;
    
    if isempty(ax)
        
        error("No Axes, something went wrong");
        
    end
    
    fig=obj.fig;
    
    if ~isvalid(fig)
        
        error("Update plot failed, invalid figure");
        
    end
    
    if ~ length(ax)==length(d)
        
        error( "Update plot failed, n. axes is different than n. plots");
        
    end
    
    for i=1:length(ax)
        
        if ~isvalid(ax(i))
           
            error("Invalid axes, something went wrong");
            
        end        
        
        x_reference=table2array(d(i).data(:,1));
        
        delete(ax(i).Children);
        
        k=1;
        
        ax(i).XAxis.Label.String=d(i).XAxisLabel;
        
        ax(i).YAxis.Label.String=d(i).YAxisLabel;
        
        ax(i).YLim=d(i).YAxisLim;
        
        ax(i).XLim=[min(x_reference) max(x_reference)];
        
        ax(i).XTick=linspace(ax(i).XLim(1),ax(i).XLim(2),5);
        
        ax(i).YTick=linspace(ax(i).YLim(1),ax(i).YLim(2),5);
        
        for j=1:2:width(d(i).data)
            
            x=table2array(d(i).data(:,j));
            
            y=table2array(d(i).data(:,j+1));
            
            l(i,k)=line(ax(i), x,y);
            
            l(i,k).DisplayName=d(i).LegendLabel(k);
            
            opts=d(i).LineOption{k};
            
            for n=1:2:length(opts)
                
                set(l(i,k),opts{n},opts{n+1});
                
            end
            
            k=k+1;
            
            ax(i).NextPlot='add';
            
        end
        
    end
    
    opt_params=obj.opt_obj.get_OptParam;
    
    for i=1:length(opt_params)
        
        opt_params(i).update_graphics;
        
    end
    
    drawnow;

end
