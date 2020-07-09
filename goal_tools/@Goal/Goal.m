classdef Goal < matlab.mixin.Copyable
    
    % handles goal functions
    %
    % gettable properties:
    % label -> goal name
    % f_array -> frequency (independent) axis
    % goal -> goal (dependent) axis
    %
    %
    % OSS: goal and f_array have to have same length,
    % to reinitialize start from f_array, then goal
    %
    % methods:
    % Goal -> pass options after property name , es
    % t=Goal('f_array',[0:1:10],'goal',[0:1:10]','Label','test');
    %
    % set_f_array -> set frequency (independent) axis
    % set_goal -> set goal (dependent) axis
    % set_label -> set goal name 
    
    properties (Access=private,Constant)
        
        def_min=0.5;
        def_max=1.5;
        
    end
    
    properties (SetAccess=protected)
        
        label="Default";
        
        f_array=Goal.def_min:0.01:Goal.def_max;
        
        goal;
        
    end
    
    properties (SetAccess=protected)
        
        test_indexes;
        
    end
    
    methods 
       
        function obj=Goal(varargin)
            
            obj.init_goal(varargin{:});
        
        end
        
        function set_goal(obj,new_val)
            
            if ~ length(new_val)==length(obj.f_array)
                
                error('Mismatch in goal array');
                
            else
                
                obj.goal=new_val;
                
            end
            
        end
        
        function set_f_array(obj,new_val)
            
            if length(new_val) == length(obj.f_array)
                
                obj.f_array=new_val;
                
            else
                
                obj.f_array=new_val;
                
                obj.goal=linspace(obj.def_min,obj.def_max,length(new_val));
            
            end
            
        end
        
        function set_label(obj,newlabel)
            
            if ischar(newlabel)
                
                obj.label=string(newlabel);
                
            else
                
                if isstring(newlabel)
                    
                    obj.label=newlabel;
                    
                else
                    
                    error(0,"Non-string label for goal");
                    
                end
                
            end
            
        end
        
        function find_indexes(obj,f_test)
        
            idx=[];
            
            for i=1:length(obj.f_array)
               
                [~,idx(i)]=min(abs(f_test-obj.f_array(i)));
                
            end
            
            obj.test_indexes=idx;
        
        end
        
    end
    
end
