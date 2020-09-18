classdef MEMSStarBranch < OptNLBranch
    
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
    
        label = "Star Branch with MEMS BP Filter + NL Series Res";
        
    end
    
    properties (Access=protected,Constant)
        
        def_kt2=0.03;
        def_q_u=2e3;

    end
    
    methods
    
        function obj=MEMSStarBranch(varargin)
            
            obj.init_branch(obj,varargin{:});
            
        end
        
    end
    
    methods (Access=protected)
        
        init_branch(obj,varargin);
        
        m=ABCD(obj,freq);
        
        m=ABCD_inverse_branch(obj,freq);
        
    end
       
end
