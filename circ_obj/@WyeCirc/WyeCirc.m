classdef WyeCirc<StarBranch & OptCirc  

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
%
% Private:
% callback_term()    -> updates ref_impedance of each resonator
%                       in passive and nlres
% callback_goal()    -> updates design when goals are edited

    
    methods 
        
        function obj=WyeCirc(varargin)
            
            obj@OptCirc(varargin{:});

            obj.label = "OptCirc with Wye Design" ;
            
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

