classdef StarBranch < OptNLBranch
    
% Contains an OptBandPassFilt and OptNLSeriesRes
% member of OptNLBranch
% 
% ------ PROPERTIES ------
% 
% Public:
% label
% 
% ------ METHODS ------
% 
% Public:
% StarBranch(varargin) -> 
%                         
%                         OSS: all resonators have q_unloaded set to 
%                         not optimizable
%
% Protected:
% init_branch(varargin) ->pass {'order',N} to initialize 
%                         passive as OptBandPassFilt(N-1)
%                         nlres as OptNLRes
%                         +options for OptNLSeriesRes
% ABCD(freq)           -> calculates ABCD matrix 
  	
    properties 
    
        label = "Star Branch with BP Filter + NL Resonator";
        
    end
    
    methods
    
        function obj=StarBranch(varargin)
            
            obj.init_branch(obj,varargin{:});
            
        end
        
    end
    
    methods (Access=protected)
        
        init_branch(obj,varargin);
        
        m=ABCD(obj,freq);
        
        m=ABCD_inverse_branch(obj,freq);
        
    end
       
end
