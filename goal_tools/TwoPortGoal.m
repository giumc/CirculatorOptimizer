classdef TwoPortGoal < matlab.mixin.Copyable & handle
    
    % handles two-port network goal functions
    %
    % properties (settable as Name Value pairs in constructor):
    %  ILgoal (Goal)
    %  ISOgoal (Goal)
    %  RLgoal (Goal)
    % methods:
    % set_f_array -> set f axis of all goals
    
    properties (Access=private,Constant)
        
        def_min=0.5;
        def_array=0.5:0.01:1.5;
        def_max=1.5;
        
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
        
        function init_goal(obj,varargin)
        
            if ~isempty(varargin)
                
                for i=1:length(varargin)
                    
                    if ischar(varargin{i}) || isstring(varargin{i})
                        
                        switch varargin{i}

                            case 'f_array'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.f_array=varargin{i+1};

                                        obj.ILgoal.set_f_array(obj.f_array);

                                        obj.ISOgoal.set_f_array(obj.f_array);

                                        obj.RLgoal.set_f_array(obj.f_array);

                                    end

                                end

                            case 'ILgoal'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.ILgoal.set_goal(varargin{i+1});

                                    end

                                end

                            case 'ISOgoal'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.ISOgoal.set_goal(varargin{i+1});

                                    end

                                end

                            case 'RLgoal'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.RLgoal.set_goal(varargin{i+1});

                                    end

                                end

                        end
                        
                    end
                    
                end
                
            end
            
        end
        
    end
      
end
    
