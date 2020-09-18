classdef MEMSStarCirc < MEMSStarBranch & OptCirc  

% Class for optimizable star topology circulator
% member of OptCirc
%
% ------ METHODS ------
%
% Public:
% StarCirc(varargin) -> you can pass {'order',N} to initialize
%                       filter order
%                       (initializes design as StarBranch)
% reset_circ ->         overrides the OptCirc version
% Protected:
% ABCD(freq)
%
    
    methods 
        
        function obj=MEMSStarCirc(varargin)
            
            obj@OptCirc(varargin{:});

            obj.label = "OptCirc with MEMS Star Design " ;
            
        end
        
        function delete(obj)
        
            obj.delete@OptCirc;
            
        end
        
        reset_circ(obj);
        
    end
    
    methods (Access=protected)
        
        [m,varargout]=ABCD(obj,freq);
        
        
    end    
    
end   

