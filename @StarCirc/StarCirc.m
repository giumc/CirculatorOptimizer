
classdef StarCirc < OptCirc & StarBranch 

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
            
            obj.init_branch(varargin{:});
            
            obj.f_test = obj.calculate_frf();
            
            obj.label = "OptCirc with Star Design" ;
            
            if ~isempty(obj.passive)
                
                obj.order = obj.passive.order +1;
                
                obj.passive.set_ref_impedance(obj.def_term);
                
            else
                
                obj.order = 1;
                
            end
                
            obj.load.optimizable=false;
            
            obj.load.set_value(obj.def_term,'override');
            
            obj.plot_tools=CircOptPlot(obj,varargin{:});
            
            addlistener(obj.load,'ValueUpdate',@obj.callback_term);
            
            addlistener(obj,'UpdateGoal',@obj.callback_goal);
            
        end
        
        function delete(obj)
        
            obj.plot_tools.delete;
        
        end
        
        
    end
    
    methods (Access=protected)
        
        m=ABCD(obj,freq);
        
    end
    
    methods (Access=private)
        
        function callback_term(obj,~,~)
        
            new_value=obj.load.value;
            
            if ~isempty(obj.passive)
                
                obj.passive.set_ref_impedance(new_value);
                
            end
            
            obj.nlres.set_ref_impedance(new_value);
        
        end        
        
        function callback_goal(obj,~,~)
            
            obj.init_goal('order',obj.order,...
                'iso_bandwidth',obj.iso_bandwidth,...
                'tx_bandwidth',obj.tx_bandwidth,...
                'f_center',obj.f_center,...
                'tx_direction',obj.tx_direction);
                
            obj.init_branch('order',obj.order);
            
            obj.f_test=obj.calculate_frf;
            
            obj.nlres.f_center.set_value(obj.f_center,'override');
            
            if ~isempty(obj.passive)
                
                for i=1:length(obj.passive.resonators)

                    obj.passive.resonators(i).f_center.set_value(obj.f_center,'override');
    %                 obj.passive.resonators(i).q_loaded.set_value(1/obj.tx_bandwidth,'override');

                end
                
            end
        
        end
        
    end    
    
end   

