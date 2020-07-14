classdef TwoPortGoal < matlab.mixin.Copyable
    
    % handles two-port network goal functions
    %
    % properties (settable as Name Value pairs in constructor):
    %  ILgoal (Goal)
    %  ISOgoal (Goal)
    %  RLgoal (Goal)
    % methods:
    % set_f_array -> set f axis of all goals
    
    properties (Access=protected,Constant)
        
        def_min=0.5;
        def_array=0.5:0.01:1.5;
        def_max=1.5;
        fpoints=81;
        
    end
    
    properties (SetAccess=protected)

        ILgoal=Goal('label',"Insertion Loss",...
            'f_array',TwoPortGoal.def_array,...
            'goal',ones(1,length(TwoPortGoal.def_array)));
        
        ISOgoal=Goal('label',"Isolation",...
            'f_array',TwoPortGoal.def_array,...
            'goal',ones(1,length(TwoPortGoal.def_array)));
        
        RLgoal=Goal('label',"Return Loss",...
            'f_array',TwoPortGoal.def_array,...
            'goal',zeros(1,length(TwoPortGoal.def_array)));
       
        f_test;
        
    end
    
    methods
        
        function obj=TwoPortGoal(varargin)
            % if no argument is passed, initialize TwoPortGoal
            % with default f_array ( 0.5:0.01:1.5 )
            % and default goal values 
            % else read arrays
            obj.init_goal(varargin{:});
                    
        end
        
        function set_f_array(obj,newval)
                    
            obj.ILgoal.set_f_array(newval);
            obj.ISOgoal.set_f_array(newval);
            obj.RLgoal.set_f_array(newval);
                    
        end
        
    end
    
    methods (Access=protected)
        
        init_goal(obj,varargin);
        
        calculate_ftest(obj);
        
    end
      
end
    
