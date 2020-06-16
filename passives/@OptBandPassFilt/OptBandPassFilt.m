classdef OptBandPassFilt < TwoPortPassive
    
    % all-poles bandpass filter with optimizable resonators
    % filter order can be passed as argument to constructor
    %
    % properties
    % order (int32)
    % resonators -> array of resonators (OptSeriesRes and OptParalRes)
    % 
    % methods
    % OptBandPassFilt(varargin) -> accepts order as argument

    properties (Access=private,Constant)
        def_f=1;
        def_q_l=3;
    end
    
    properties 
        
        order int32 = 1;
       
        resonators OnePortRes;
        
    end
    
    methods 
       
        function obj=OptBandPassFilt(varargin)
            
            if ~isempty(varargin)
            
                obj.order=varargin{1};
           
            end
            
            for i=1:obj.order

                obj.resonators(i)=obj.pick_resonator(i,obj.def_f,obj.def_q_l);
            
            end
            
        end
        
        m=ABCD(obj,freq);
                
    end
    
    methods (Static) 
        
        resonator=pick_resonator(n,f,q);
        
    end
    
end
