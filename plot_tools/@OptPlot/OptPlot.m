classdef (Abstract) OptPlot < handle & matlab.mixin.SetGet
    
    % abstract class with GUI for optimizable components
    % 
    % 
    % ---- PROPERTIES-----
    % 
    % Protected:
    % opt_obj (GetSetOptParam)        -> contains interactive object
    % type "full","minimal","none"    -> sets type of GUI *
    % label                           -> sets fig name *
    % 
    % various graphical constant 
    % various graphical children of GUI
    % * setting those results in GUI reset
    % 
    % ---- METHODS -------
    % 
    % Public:
    % setup_plot
    % clear_plot              -> launched in delete();
    % reset_plot
    % 
    % Protected,Abstract:
    % p=generate_plot_data    -> pass structures with plot data 
    % 
    % plot data instructions:
    % cell array of structures, each one with the following fields
    % p.Data  -> table with (X,Y1,X,Y2...) plot points
    % p.LineOption -> cell array of N line options
    % p.LegendLabel -> cell array with N legend names
    % p.XAxisLabel
    % p.YAxisLabel
    % p.YAxisLim
    % p.LineOption
    
   properties (Access=protected)
      
       opt_obj;
       
   end
   
   properties (SetObservable,AbortSet)
       
        type string {mustBeMember(type,["full","minimal","none"])} = "none";
        
        label string;
        
   end
   
   properties (Access=protected)
        
        unit = 'normalized'; 
        
        dxaxis_full=0.5;
        dxaxis_minimal=1;
        
        simlineoption={'LineWidth',3,...
            'Color',rgb('DarkBlue')};
        goallineoption={'LineStyle','none',...
            'MarkerSize',10,...
            'Marker','+',...
            'Color',rgb('ForestGreen'),...
            'LineWidth',3};
    
        dy_plotspacing=0.1;
        dx_plotspacing=0.02;
        
        YXratio=1/1.618;
        
        dxfig_full=1;
        dxfig_minimal=0.5;
        dyfig=1;

        dxbutton = 0.1;
        dybutton = 0.05;
        dybuttons = 0.2;
        button_spacing = 0.001;
        checkbox_spacing = 0.01;
        
        dx0optimtext=0.1;
        dy0optimtext=0.1;
        
        textfont=20;
        
        buttons_name=[...
            "Add Mode",...
            "Remove Mode",...
            "Start Fit",...
            "Stop Fit",...
            "Reset",...
            "Guess Shape",...
            "Rescale Boundaries",...
            "OptimizeAll",...
            "Save"];
        
        name_headings=[...
            "Control",...
            "Min",...
            "Max",...
            "Param",...
            "Value",...
            "O"];
        
        bars_per_column=30;

   end % graphic constant
    
   properties (Access=protected)
        
        fig matlab.ui.Figure;
        
        ax matlab.graphics.axis.Axes;
        
        legend matlab.graphics.illustration.Legend;
        
        OptParamGraphics matlab.ui.control.UIControl;
        
        buttons matlab.ui.control.UIControl;
        
   end % graphic object
   
   methods 
       
       function obj=OptPlot(varargin)
       
           if ~isempty(varargin)

                for i=1:length(varargin)

                    if isa(varargin{i},'char')||isa(varargin{i},'string')

                        switch varargin{i}

                            case 'type'

                                obj.type=varargin{i+1};

                        end

                    end

                end

           end
           
%            obj.setup_plot;

           addlistener(obj,'type','PostSet',@(x,y)obj.reset_plot);
       
           addlistener(obj,'label','PostSet',@(x,y)obj.reset_plot);
           
       end
       
       function set.opt_obj(obj,value)
        
            if ~isa(value,'GetSetOptParam')
                
                error("opt_obj in OptPlot has to be GetSetOptParam");
                
            else
                
                obj.opt_obj=value;
                
            end
       
       end
       
       function delete(obj)
       
            obj.clear_plot;
            
       end
       
   end
   
   methods (Access=protected, Abstract)
       
        plot_data=generate_plot_data(obj);
        
   end
   
   methods 
       
        setup_plot(obj);
        clear_plot(obj);
        flag=find_plot(obj);
        reset_plot(obj);
        update_plot(obj);
        tab=generate_plot_table(obj);
        
   end
   
end
