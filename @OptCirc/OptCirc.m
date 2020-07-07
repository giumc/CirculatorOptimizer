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
%
% Protected :
% optimsetup
% s_f       ->  most recent calculated s param  
%
% Public :
% ftest 
%
% SetProtected :
% design    (set-controlled to be a OptNLBranch)
% load      (set-controlled to be a OnePortPassive)
%
% ------ METHODS ------
%
% Public: 
% ABCD(freq)        -> calculates ABCD matrix
% opt_par = get_OptParam() -> get all optim param
% s_f = calculate_S_lin_response(obj) -> get response for all f_test
% set_def_bounds;
% get_OptParam;
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
        
    end
    
    properties (SetAccess=protected) 
       
%        design;
       load = OptResistor();

    end % design parameters

    methods (Access=protected)
        
        function obj=OptCirc(varargin)
        
            obj=obj@CircGoal(varargin{:});
            
        end
        
        f=calculate_frf(obj);
        
        function n=n_freqs(obj)
        
            n=2*obj.harmonics+1;
            
        end
              
    end

    methods
        
        function set.load(obj,value)
            
            if ~isa(value,'OnePortPassive')
               
                error(strcat("load property in OptCirc has to be",...
                    " a member of OnePortPassive"));
            else
                
                obj.load=value;
                
            end
            
        end
               
        s_f=calculate_S_lin_response(obj);

        test(obj);
        
    end
    
end
