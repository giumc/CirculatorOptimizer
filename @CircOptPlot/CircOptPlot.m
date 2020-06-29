classdef CircOptPlot < OptPlot 
   
    %handles circulator optimizer plots
    %
    %
    % ---- EVENT ----
    %
    % PlotUpdate
    %
    % ---- PROPERTIES -----
    % Public:
    % Name (string)
    % type ("full","minimal","none")
    %
    % Access-protected,Constant:
    % graphical constant (positioning, font)
    %
    % Access-protected:
    % fig (Figure handle)
    % ax (Axes handles)
    % sliders (UIControl handles)
    % text (TextBox handles)
    % buttons (UIControl)
    %
    % Access=protected
    % circ (OptCirc)
    % ------ METHODS ------
    %
    % Public:
    % CircOptPlot(circ,varargin)    -> pass circ + options (see help)
    % 
% setup_plot()

%     events
%         
%         PlotUpdate
%         
%     end
    
    properties (Access=private,Constant)
        
        def_label="Circulator Optimizer";
        
    end
    
    methods 
       
        function obj=CircOptPlot(circ,varargin)
                        
            obj@OptPlot(varargin{:});
            obj.opt_obj=circ;
            obj.label=CircOptPlot.def_label;
            
            obj.setup_plot;
            obj.update_plot;
            
        end
        
    end
    
    methods (Access=protected)
        
        plot_data=generate_plot_data(obj);
        
    end
    
end
