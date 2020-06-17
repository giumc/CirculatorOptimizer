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
    
    properties (SetAccess=private)
        
        order int32 = 1;
        
    end
    
    properties
        
        label = "Default";
       
        resonators OnePortRes;
        
    end
    
    methods 
       
        function obj=OptBandPassFilt(varargin)
            
            if ~isempty(varargin)
                
                if isnumeric(varargin{1})
                    
                    obj.order=varargin{1};
                    
                else
                    
                    if strcmp(varargin{1},'order')
                        
                        if ~isempty(varargin{2})
                            
                            obj.order=varargin{2};
                            
                        end
                        
                    end
                    
                end
           
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
