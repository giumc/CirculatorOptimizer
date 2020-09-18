classdef DeltaCirc < DeltaBranch & OptCirc  

% Class for optimizable wye topology circulator
% member of OptCirc
%
% ------ METHODS ------
%
% Public:
% StarCirc(varargin) -> you can pass {'order',N} to initialize
%                       filter order
%                       (initializes design as StarBranch)
% Protected:
% ABCD(freq)

    
    methods 
        
        function obj=DeltaCirc(varargin)
            
            obj@OptCirc(varargin{:});

            obj.label = "OptCirc with Delta Design" ;
            
        end
        
        function delete(obj)
            
            delete@OptCirc(obj);
        
        end
        
        %test(obj);
        
    end
    
    methods (Access=protected)
        
        [m,varargout]=ABCD(obj,freq);
        
    end    
    
end   

