classdef BandStopCircGoal<CircGoal
   
    methods 
       
        function obj=BandStopCircGoal(varargin)
        
            obj@CircGoal(varargin{:});
        
        end
        
    end
    
    methods (Access=protected)
       
        calculate_tx_points(obj);
        calculate_iso_points(obj);
        calculate_rl_points(obj);
        
    end
    
end
