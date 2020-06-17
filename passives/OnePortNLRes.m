classdef OnePortNLRes < OnePortRes
    % interface for nonlinear resonators
    % 
    % inherits from OnePortRes
    % 
    % it has extra settable property:
    % var (OptNLCap)
    % and two protected properties:
    % resis (OptResistor)
    % ind (OptInd)
    
    properties (Access=protected)
        
        resis OptResistor = OptResistor('value',1,'dummyResistor');
        
        ind OptInd = OptInd('value',1e-9,'label','dummyInductor');
        
    end
    
    properties
           
        var OptNLCap = OptNLCap('value',1e-12);

    end
    
    methods
       
        function obj=OnePortNLRes(varargin)
            
            obj=obj@OnePortRes(varargin{:});
            
            obj.var=OptNLCap(varargin{:});
            
            obj.resis.optimizable=false;
            
            obj.ind.optimizable=false;

        end
        
    end
    
end
