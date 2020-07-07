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

        harmonics=2;

        phases=[0 120 240]; 
        
        fpoints=201;
        
        def_term=1;
        
    end

    properties (Access=protected) 
        
        optimsetup=struct();
        s_f;
        
    end %optim variables

    properties 

        f_test;
        
        plot_tools;
        
    end
    
    properties (Access=protected) 

       load = OptResistor();

    end % design parameters

    methods (Access=protected)
        
        f=calculate_frf(obj);
        
        function n=n_freqs(obj)
        
            n=2*obj.harmonics+1;
            
        end
              
    end
    
    methods

        function obj=OptCirc(varargin)
        
            obj=obj@CircGoal(varargin{:});
            
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

        test(obj);
        
    end
    
end
