classdef StarCirc < OptCirc 

% Class for optimizable star topology circulator
% member of OptCirc
%
% ------ PROPERTIES ------
%
% Public :
% label
% 
% ------ METHODS ------
%
% Public:
% StarCirc(varargin) -> you can pass {'order',N} to initialize
%                       filter order
%                       (initializes design as StarBranch)
    
    properties (Access=private)
                
        def_f_c=1;
        def_max_q_l=10;
        
    end
    
    properties 
        
        label =  "OptCirc with Star Design";
        
    end
    
    methods 
        
        function obj=StarCirc(varargin)
            
            obj.f_test=obj.calculate_frf();
            
            obj.design=StarBranch(varargin{:});
            
            if ~isempty(obj.design.passive)
                
                obj.order = obj.design.passive.order +1;
                
                obj.design.passive.set_ref_impedance(obj.def_term);
                
            else
                
                obj.order = 1;
                
            end
                
            obj.load.optimizable=false;
            
            addlistener(obj.load,'ValueUpdate',@obj.callback_term);
            
            addlistener(obj,'UpdateGoal',@obj.callback_goal);
            
        end
        
    end
    
    methods (Access=private)
        
        function callback_term(obj,~,~)
        
            new_value=obj.load.value;
            
            if ~isempty(obj.design.passive)
                
                obj.design.passive.set_ref_impedance(new_value);
                obj.design.nlres.set_ref_impedance(new_value);
            end
        
        end
        
        function callback_goal(obj,~,~)
        
            obj.design.nlres.f_center.set_value(obj.f_center);
            
            for i=1:length(obj.design.passive.resonators)
                
                obj.design.passive.resonators(i).f_center.set_value(obj.f_center);
                obj.design.passive.resonators(i).q_loaded.set_value(1/2/obj.tx_bandwdith);
                
            end
        
        end
        
    end    
    
end   

