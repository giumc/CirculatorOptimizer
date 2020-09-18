classdef OptBandStopFilt < OptLadderFilt

    properties 
        
        label = "Optimizable All poles BandStop LC Filter ";
        
    end
    
    methods 
       
        function obj=OptBandStopFilt(varargin)
            
            obj@OptLadderFilt(varargin{:});
            
        end
       
    end
    
    methods (Access=protected) 
        
        resonator=pick_resonator(obj,n_res);
        m=ABCD(obj,freq);
        
    end

end
