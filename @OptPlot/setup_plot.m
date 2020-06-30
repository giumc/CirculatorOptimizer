function setup_plot(obj,varargin)

 % sets up figure . if another figure is open, it is overwritten
 % if extra parameters are present, they are passed to figure()
 
 % constants definition
 
 x0fig=0;
 y0fig=0;
 dyfig=obj.dyfig;
 dx_plotspacing=obj.dx_plotspacing;
 dy_plotspacing=obj.dy_plotspacing;
 units=obj.unit;
 figlabel=obj.label;
 
 switch obj.type
     
     case "full"
        dxfig= obj.dxfig_full;
        dxaxis=obj.dxaxis_full;
        
     case "minimal"
        dxfig=obj.dxfig_minimal;
        dxaxis=obj.dxaxis_minimal;
        
     case "none"
        obj.clear_plot;
        return
        
 end

%% Figure

    if ~isempty(obj.fig)
        
            if isvalid(obj.fig)
                
                obj.clear_plot;
                
            else
                
                obj.fig=figure(varargin{:});
                
            end
            
    else
        
        if ~obj.find_plot
            
                obj.fig=figure(varargin{:});
        
        end
            
    end

    obj.fig.Name=figlabel;
    obj.fig.Units=units;
    obj.fig.OuterPosition=[x0fig y0fig x0fig+dxfig y0fig+dyfig];


%% Axes
    
%     obj.ax=[];
    
    plot_data=obj.generate_plot_data;
    
    for i=1:length(plot_data)
        
        ax(i)=axes(obj.fig);
        ax(i).YLabel.String =   'YAxisLabel';
        ax(i).XLabel.String =   'XAxisLabel';
        ax(i).Color         =   rgb('White');
        ax(i).GridLineStyle =   '-.';
        ax(i).XGrid         =   'on';
        ax(i).YGrid         =   'on';
        leg(i)              =   legend(ax(i));
        leg(i).Visible      =   'on';
        leg(i).Color        =   rgb('LightGrey');
        leg(i).Box          =   'on';
        leg(i).Location     =   'southeast';
        
    end
    
    % can be made more complex here if needed
    
    if length(plot_data)==4
        
        dxaxis=dxaxis/2;
        dyaxis=obj.YXratio*dxaxis;
        y0fig=y0fig+dyaxis-dy_plotspacing/2;
        
    end
    
    if length(plot_data)==2
        
        dyaxis=obj.YXratio*dxaxis;
        y0fig=y0fig+dyaxis-dy_plotspacing;
    end
    
    if strcmp(obj.type,'full')
        
        dyaxis=2*dyaxis;
        y0fig=y0fig+dyaxis/2;
    end
    
    if length(plot_data)==2
        
        ax(1).OuterPosition=[x0fig, y0fig+dy_plotspacing,...
            dxaxis, dyaxis];

        ax(2).OuterPosition=ax(1).OuterPosition+...
            [0, dyaxis + 0,0,0];
    
    end
    
    if length(plot_data)==4
        
        ax(1).OuterPosition=[x0fig, y0fig+dy_plotspacing+dyaxis,...
            dxaxis, dyaxis];

        ax(2).OuterPosition=ax(1).OuterPosition+...
            [0+dxaxis, 0,0,0];

        ax(3).OuterPosition=ax(1).OuterPosition+...
            [0, 0-dyaxis,0,0];

        ax(4).OuterPosition=ax(1).OuterPosition+...
            [0+dxaxis, 0-dyaxis,0,0];

    end
    
    obj.ax=ax;
    
    if ~length(plot_data)==4 || ~length(plot_data)==2
        
       error("Case still not covered");
       
    end

end


