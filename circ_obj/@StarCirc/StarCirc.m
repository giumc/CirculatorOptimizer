classdef StarCirc < StarBranch & OptCirc  

% Class for optimizable star topology circulator
% member of OptCirc
%
% ------ METHODS ------
%
% Public:
% StarCirc(varargin) -> you can pass {'order',N} to initialize
%                       filter order
%                       (initializes design as StarBranch)
% Protected:
% ABCD(freq)
%
% Private:
% callback_term()    -> updates ref_impedance of each resonator
%                       in passive and nlres
% callback_goal()    -> updates design when goals are edited

    
    methods 
        
        function obj=StarCirc(varargin)
            
            obj@OptCirc(varargin{:});

            obj.init_circ(varargin{:});
            
            obj.update_bounds;
            
            obj.label = "OptCirc with Star Design" ;
            
            addlistener(obj,'UpdateGoal',@obj.callback_goal);
            
            obj.reset_circ;
            
            obj.setup_plot;
            
            obj.update_plot;
            
        end
        
        function delete(obj)
        
            if ~isempty(obj.plot_tools)
                obj.plot_tools.delete;
            end
        
        end
        
        reset_circ(obj);
        
        %test(obj);
        
    end
    
    methods (Access=protected)
        
        [m,varargout]=ABCD(obj,freq);
        
        init_circ(obj,varargin);
        
        function callback_term(obj,~,~)
        
            new_value=obj.load.value;
            
            if ~isempty(obj.passive)
                
                obj.passive.set_ref_impedance(new_value);
                
            end
            
            obj.nlres.set_ref_impedance(new_value);
        
        end        
        
        function callback_goal(obj,~,~)
            
            obj.init_branch('order',obj.order);
            
            obj.reset_circ;
            
            callback_goal@OptCirc(obj);
        
        end
        
    end    
    
end   

