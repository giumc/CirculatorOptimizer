classdef StarCirc < OptCirc

% Class for optimizable star topology circulator
% member of OptCirc
%
% ------ PROPERTIES ------
%
% Public :
% label
% 
% ------ METHODS ------
%
% Public:
% StarCirc(varargin) -> you can pass {'order',N} to initialize
%                       filter order
%                       (initializes design as StarBranch)

    properties 
        
        label= "OptCirc with Star Design";
               
    end
    
    methods 
        
        function obj=StarCirc(varargin)

            obj.f_test=obj.calculate_frf();

            if ~isempty (varargin)

               for i=1:length(varargin)

                   if ischar(varargin{i})|| isstring(varargin{i})

                       switch varargin{i}

                           case 'order'

                               obj.design=StarBranch(varargin{i+1});

                       end

                   end

               end

            end

            if isempty(obj.design)

               obj.design=StarBranch(1);

            end
            
        end
        
    end
    
end   

