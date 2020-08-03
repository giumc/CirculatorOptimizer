classdef StarCirc < StarBranch & OptCirc  

% Class for optimizable star topology circulator
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
        
        function obj=StarCirc(varargin)
            
            obj@OptCirc(varargin{:});

            obj.label = "OptCirc with Star Design" ;
            
        end
        
        function delete(obj)
        
            obj.delete@OptCirc;
            
        end
               
    end
    
    methods (Access=protected)
        
        [m,varargout]=ABCD(obj,freq);
        
    end    
    
end   

