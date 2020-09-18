classdef OptBandPassFilt < OptLadderFilt
      
% all poles BP Filter
% member of OptLadderFilt
% 
% ------ PROPERTIES ------
% 
% Public:
% label (string)
% 
% ------ METHODS ------
% Protected (Static) :
% pick_resonator(n,fc,ql,qu) -> initialize res according to n to
%                                default fc ql qu

    properties 
        
        label = "Optimizable All poles BandPass LC Filter ";
        
    end
    
    methods 
       
        function obj=OptBandPassFilt(varargin)
            
            obj@OptLadderFilt(varargin{:});
            
        end
       
    end
    
    methods (Access=protected) 
        
        resonator=pick_resonator(obj,n_res);
        m=ABCD(obj,freq);
        
    end
        
end
