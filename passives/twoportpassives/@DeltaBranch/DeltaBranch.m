classdef DeltaBranch < OptNLBranch
    
    properties 
    
        label = "Delta Branch with BP Filter + NL Resonator";
        
    end
    
    methods
    
        function obj=DeltaBranch(varargin)
            
            obj.init_branch(obj,varargin{:});
            
        end
        
    end
    
    methods (Access=protected)
        
        init_branch(obj,varargin);
        
        m=ABCD(obj,freq);
        
        m=ABCD_inverse_branch(obj,freq);
        
    end    
    
end
