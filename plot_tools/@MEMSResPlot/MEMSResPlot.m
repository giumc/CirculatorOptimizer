classdef MEMSResPlot< OptPlot
   
    properties (Access=private,Constant)
        
        def_label='Resonator Plot';
        def_type="minimal";
        
    end
    
    properties (Access=protected)
        
        f_test;
        
    end
    
    methods 
        
        function obj=MEMSResPlot(res,varargin)
        
            obj=obj@OptPlot(varargin{:},'label',MEMSResPlot.def_label,...
                'type',MEMSResPlot.def_type);
            
            obj.opt_obj=res;
            
            obj.calculate_ftest;
            
            obj.setup_plot;
            
            obj.update_plot;
            
        end
        
    end
    
    methods (Access=protected)
        
        plot_data=generate_plot_data(obj);
        
        calculate_ftest(obj);
        
        y_f=calculate_y_f(obj);
        
    end
    
end
