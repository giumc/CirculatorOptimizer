classdef (Abstract) TwoPortPassive < handle
    
    properties (Abstract)
        
        label string;
        
    end
    
    methods (Abstract)
        
        m = ABCD (obj,freq)
        
    end
    

end
