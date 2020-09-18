classdef DeltaStarCirc < StarBranch & OptCirc
    
    properties (Access=private)
        
        circ_def_mod_freq=0.01;
        
        circ_def_mod_depth=0.1;
        
    end
    
    methods
       
        function obj=DeltaStarCirc(varargin)
            
            obj@OptCirc(varargin{:});
            
            obj.def_mod_freq=obj.circ_def_mod_freq;
            
            obj.def_mod_depth=obj.circ_def_mod_depth;
            
            obj.label = "OptCirc with Delta Star Design" ;
            
            obj.reset_circ;
            
        end
        
        function delete(obj)
            
            delete@OptCirc(obj);
        
        end
        
    end
    methods
       
        reset_circ(obj);
        
    end
    methods (Access=protected)
        
        [m,varargout]=ABCD(obj,freq);
        
    end
    
end
