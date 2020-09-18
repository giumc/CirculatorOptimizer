classdef ParallelCoupledFilter <TwoPort
   
    properties (Access=protected)
        
        coupledlines TwoPort;
        
    end
    
    methods 
       
        function obj=ParallelCoupledFilter(varargin)
        
            set_if_valid(varargin,...
                {{'n','order','N'}},...
                {@(x) obj.reset_coupledlines(x,varargin{:})});
            
        end
        
        function reset_coupledlines(obj,nres,varargin)
        
            for i=1:nres
               
                obj.coupledlines(i)=CoupledMicrostrip(varargin{:});
                
            end
        
        end
        
    end
    
    methods 
        
        function m=ABCD(obj,freq)
        
            m=diag(ones(1,2));
            
            for i=1:length(obj.coupledlines)
               
                m=m*obj.coupledlines(i).ABCD(freq)
                
            end
            
        end
        
        function beta=get_prop_const(obj,freq)
        
        end
    
    end
    
end
