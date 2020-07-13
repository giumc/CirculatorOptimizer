classdef CircGoal < TwoPortGoal
    
    % TwoPortGoal object with special methods to set f points and goals
    % to implement circulator goals
   
    properties (SetObservable,AbortSet)
        
        direction int32 = 2;
        
        bandwidth double = 0.1;
        
        f_center double = 1; 
        
        order int32  = 1 ;
        
    end
    
    events
        
        UpdateGoal
        
    end
    
    methods 
        
        function obj=CircGoal(varargin)
            
            obj.init_goal(varargin{:});
            
            obj.calculate_goals;
            
            addlistener(obj,'direction','PostSet',@obj.update_goals);
            addlistener(obj,'bandwidth','PostSet',@obj.update_goals);
            addlistener(obj,'f_center','PostSet',@obj.update_goals);
            addlistener(obj,'order','PostSet',@obj.update_goals);
            
        end
        
    end
    
    methods (Access=protected)
       
        calculate_tx_points(obj);
        calculate_iso_points(obj);
        calculate_rl_points(obj);
        
        function calculate_goals(obj)

            calculate_tx_points(obj);
            calculate_iso_points(obj);
            calculate_rl_points(obj);
        
        end
        
        function update_goals(obj,~,~)
        
            obj.calculate_goals;
            notify(obj,'UpdateGoal');
        end
        
        
    end
    
    methods (Access=protected)
       
        function init_goal(obj,varargin)
        
            init_goal@TwoPortGoal(obj,varargin{:});
        
            if ~isempty(varargin)
                
                for i=1:length(varargin)
                    
                    if isstring(varargin{i})||ischar(varargin{i})
                        
                        switch varargin{i}
                            
                            case 'bandwidth'
                                
                                obj.bandwidth=varargin{i+1};
                                
                            case 'direction'
                                
                                obj.direction=varargin{i+1};
                        
                        end
                        
                    end
                    
                end
                
            end
        
        end
        
    end
            
end
