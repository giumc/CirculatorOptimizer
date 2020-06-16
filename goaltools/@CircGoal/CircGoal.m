classdef CircGoal < TwoPortGoal
    
    % TwoPortGoal object with special methods to set f points and goals
    % to implement circulator goals
   
    properties (SetObservable,AbortSet)
        
        tx_direction int32 = 2;
        
        tx_bandwidth double = 0.1;
        
        iso_bandwidth double = 0.1;
        
        f_center double = 1; 
        
        order int32  = 1 ;
        
    end
    
    methods 
        
        function obj=CircGoal(varargin)
            
            obj=obj@TwoPortGoal(varargin);
            
            obj.calculate_goals;
            
            addlistener(obj,'tx_direction','PostSet',@obj.update_goals);
            addlistener(obj,'tx_bandwidth','PostSet',@obj.update_goals);
            addlistener(obj,'iso_bandwidth','PostSet',@obj.update_goals);
            addlistener(obj,'f_center','PostSet',@obj.update_goals);
            addlistener(obj,'order','PostSet',@obj.update_goals);
            
        end
        
    end
    
    methods (Access=private)
       
        calculate_tx_points(obj);
        calculate_iso_points(obj);
        calculate_rl_points(obj);
        
        function calculate_goals(obj)

            calculate_tx_points(obj);
            calculate_iso_points(obj);
            calculate_rl_points(obj);
        
        end
        
    end
    
    methods (Access=private,Static)
       
        function update_goals(obj,~,~)
        
            obj.calculate_goals;
            
        end
        
    end
            
end
