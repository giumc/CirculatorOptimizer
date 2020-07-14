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
    % Access=protected
    % circ (OptCirc)
    % ------ METHODS ------
    %
    % Public:
    % CircOptPlot(circ,varargin)    -> pass circ + options (see help)
    %     
    properties (Access=private,Constant)
        
        def_label="Circulator Optimizer";
        
    end
    
    methods 
       
        function obj=CircOptPlot(circ,varargin)
                
            if ~isempty(varargin)
                
                varargin=[varargin(:)' ,...
                    {'label'},{CircOptPlot.def_label}];
                
            else
                
                varargin={'label',...
                    CircOptPlot.def_label};
                
            end
            
            obj@OptPlot(varargin{:});
            obj.opt_obj=circ;

            
        end
        
    end
    
    methods (Access=protected)
        
        plot_data=generate_plot_data(obj);
        
    end
    
end
