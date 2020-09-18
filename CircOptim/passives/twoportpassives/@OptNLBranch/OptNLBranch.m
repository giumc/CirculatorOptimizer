classdef (Abstract) OptNLBranch < TwoPortPassive & ...
                                   matlab.mixin.SetGet 

% Interface for nonlinear branches
% inherits from TwoPortPassive, SetGet and Copyable
% 
% ------ PROPERTIES ------
% 
% Public :
% passive (set-controlled to be a TwoPortPassive)
% nlres (set-controlled to be a OnePortNLRes)

% ------ METHODS -----
%
% Public:
% get_OptParam()           ->  returns optimizable OptParam
% set_def_bounds(obj)       -> sets default boundaries

    properties (Access=protected,Constant)
        
        def_f_c=1;
        def_q_l=5;
        def_term=1;
        
    end
    
    properties 
        
        passive ;
        nlres ;
        
    end
    
    properties (Dependent)
        
        mod_freq;
        mod_depth;
        mod_phase;
        
    end
    
    methods  

        function set.passive(obj,value)

            if ~isa(value,'TwoPortPassive')

                error('passive property needs to be member of TwoPortPassive');

            else

                obj.passive=value; 

            end

        end

        function set.nlres(obj,value)

            if ~isa(value,'OnePortNLRes')

                error('nlres property needs to be member of OnePortNLRes');

            else

                obj.nlres=value; 

            end

        end

        function opt_par=get_OptParam(obj)


            if ~isempty( obj.passive)

                opt_par=obj.passive.get_OptParam;

            else

                opt_par=[];

            end

            opt_par= [opt_par obj.nlres.get_OptParam ];

        end

        function v=get.mod_freq(obj)
            v=obj.nlres.mod_freq;
        end

        function v=get.mod_depth(obj)
            v=obj.nlres.mod_depth;
        end

        function v=get.mod_phase(obj)
            v=obj.nlres.mod_phase;
        end
        
        varargout=summary(obj);
        
    end
    
    methods (Access=protected)
        
        init_branch(obj,varargin);
        
    end
    
end
