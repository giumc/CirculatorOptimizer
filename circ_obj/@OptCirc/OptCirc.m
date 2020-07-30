classdef (Abstract) OptCirc <  CircGoal & ...
                    OptNLBranch

% Interface for optimizable circulators
% inherits from CircGoal and OptNLBranch
%
% ------ PROPERTIES ------
%
% Protected Constant :
% harmonics 
% phases
% fpoints
% def_term
%
% Set Protected:
% load (OptResistor)
%
% Protected :
% optimsetup
% s_f       ->  most recent calculated s param  
%
% Public :
% ftest 
% plot_tools -> has to be a CircOptPlot instance
%
% ------ METHODS ------
%
% Public: 
% ABCD(freq)        -> calculates ABCD matrix
% s_f = calculate_S_lin_response(obj) -> get response for all f_test
%
% Protected :
%
% calculate_frf()   -> calculates ftest
% n_freqs()         -> calculates number of frequencies

    properties (Access=protected,Constant)

        harmonics=1;

        phases=[0 120 240]; 
        
        def_term=1;
        
        def_mod_freq=0.2;
        
        def_mod_depth=0.2;
        
        def_max_mod_freq=0.5;
        
        def_max_mod_depth=0.5;
        
    end

    properties (Access=protected) 

        load OptResistor;
        optimsetup=struct();
        plot_tools;
        s_f;
        
    end % design parameters
    
    methods

        function obj=OptCirc(varargin)
        
            obj=obj@CircGoal(varargin{:});
            
            obj.init_circ(varargin{:});
            
            obj.load=OptResistor('value',OptCirc.def_term);
            
            obj.load.optimizable=false;
            
            obj.setup_plot;
            
            obj.reset_circ;
            
            addlistener(obj.load,'ValueUpdate',@obj.callback_term);
            
            addlistener(obj,'UpdateGoal',@obj.callback_goal);
            
        end
        
        function delete(obj)
        
            if ~isempty(obj.plot_tools)
                obj.plot_tools.delete;
            end
        
        end
        
        function set.load(obj,value)
            
            if ~isa(value,'OnePortPassive')
               
                error(strcat("load property in OptCirc has to be",...
                    " a member of OnePortPassive"));
            else
                
                obj.load=value;
                
            end
            
        end
              
        function set.plot_tools(obj,value)
        
            if ~isa(value,'OptPlot')
                
                error("plot_tools property has to be a member of OptPlot");
                
            else
                
                obj.plot_tools=value;
                
            end
            
        end
        
        s_f=calculate_S_lin_response(obj);

        optim_routine(obj);

        function setup_plot(obj,varargin)

            if isempty(obj.plot_tools)

                obj.plot_tools=CircOptPlot(obj,varargin{:});

            end

            obj.plot_tools.setup_plot;

        end
        
        function update_plot(obj,varargin)

            if ~isempty(obj.plot_tools)
                
                obj.plot_tools.update_plot;
                
            end

        end
        
        function save_data(obj,varargin)
        
            obj.plot_tools.save_plot(varargin{:});
            
        end
        
        update_bounds(obj);
        
        reset_circ(obj);
        
        test(obj);
        
    end
    
    methods (Access=protected)
        
        callback_goal(obj,~,~);
        
        callback_term(obj,~,~);
        
        function n=n_freqs(obj)
        
            n=2*obj.harmonics+1;
            
        end
        
        err=error_function(obj,varargin);
        
        err=fine_error_function(obj,varargin);
        
        fine_optim(obj);
        
        init_circ(varargin);
        
    end
    
end
