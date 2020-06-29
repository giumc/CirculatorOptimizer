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

    properties 
        
        passive ;
        nlres ;
        
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
            
            opt_par=obj.passive.get_OptParam;
            
            opt_par= [opt_par obj.nlres.get_OptParam ];
        
        end
        
        function set_bounds(obj)
            
            obj.passive.set_bounds;
            obj.nlres.set_bounds;
            
        end
        
    end
    
end
