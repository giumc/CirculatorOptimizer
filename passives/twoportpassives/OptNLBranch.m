classdef (Abstract) OptNLBranch < TwoPortPassive & ...
                                   matlab.mixin.SetGet & ...
                                  matlab.mixin.Copyable

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
% get_opt_param()           ->  returns optimizable opt_param

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
        
        function opt_par=get_opt_param(obj)
            
            opt_par=obj.passive.get_opt_param;
            
            opt_par= [opt_par obj.nlres.get_opt_param ];
        
        end
        
    end
    
end
