classdef (Abstract) OptCirc <  CircGoal & ...
                    TwoPortPassive

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
       
       design;
       load = OptResistor();

    end % design parameters

    methods (Access=protected)
        
        function obj=OptCirc(varargin)
        
            obj=obj@CircGoal(varargin{:});
            
        end
        
        function f=calculate_frf(obj)
                f_min = max(...
                    0,...
                    min(obj.f_center*(1-obj.tx_bandwidth),...
                        obj.f_center*(1-obj.iso_bandwidth)));
                f_max= max(...
                    obj.f_center*(1+obj.iso_bandwidth),...
                    obj.f_center*(1+obj.tx_bandwidth));
                f=linspace(f_min,f_max,obj.fpoints);
                
        end
        
        function n=n_freqs(obj)
        
            n=2*obj.harmonics+1;
            
        end
              
    end

    methods
        
        function set.design(obj,value)
            
            if ~isa(value,'OptNLBranch')
                
                error ( "design has to be a OptNLBranch instance");
                
            else
                
                obj.design=value;
                
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
        
        m=ABCD(obj,freq);
        
        s_f=calculate_S_lin_response(obj);
        
        function set_bounds(obj)
            
            obj.design.set_bounds;
            
        end
        
        function param = get_OptParam(obj)
            
            param=obj.design.get_OptParam;
        
        end
        
        debug_test(obj);
        
    end
    
end
