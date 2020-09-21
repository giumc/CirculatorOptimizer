classdef ParallelCoupledFilter < BPFilter & TwoPort
   
    properties (Access=protected)
        
        coupledlines CoupledMicrostrip;
        
    end
    
    methods 
       
        function obj=ParallelCoupledFilter(coeffs,omega_c,bw,z_term,varargin)
        
            obj@BPFilter(coeffs,omega_c,bw,z_term);
            
            obj.set_coupledlines(varargin{:});
            
        end
        
        function reset_coupledlines(obj,varargin)
        
            for i=1:nres
               
                obj.coupledlines(i)=CoupledMicrostrip(varargin{:});
                
            end
        
        end
        
    end
    
    methods 
        
        function m=ABCD(obj,freq)
        
            m=diag(ones(1,2));
            
            for i=1:length(obj.coupledlines)
               
                m=m*obj.coupledlines(i).ABCD(freq);
                
            end
            
        end
        
        ret=get_prop_const(obj,freq);
        
        varargout=summary(obj);
        
        solve_for_Z(obj);
        
        set_coupledlines(obj,varargin);
        
        ret=get_coupledlines(obj);
        
        ret=get_param_table(obj);
        
        solve_for_lambda4(obj);
        
    end
    
end
