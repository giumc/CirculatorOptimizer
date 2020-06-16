classdef TwoPortGoal < matlab.mixin.Copyable & handle
    
    % handles two-port network goal functions
    %
    % properties (settable as Name Value pairs in constructor):
    %  IL (Goal)
    %  ISO (Goal)
    %  RL (Goal)
    % methods:
    % set_f_array -> set f axis of all goals
    
    properties (Access=private,Constant)
        
        def_min=0.5;
        def_array=0.5:0.01:1.5;
        def_max=1.5;
        
    end
    
    properties (SetAccess=protected)

        IL=Goal('label',"Insertion Loss",...
            'f_array',TwoPortGoal.def_array,...
            'goal',ones(1,length(TwoPortGoal.def_array)));
        
        ISO=Goal('label',"Isolation",...
            'f_array',TwoPortGoal.def_array,...
            'goal',ones(1,length(TwoPortGoal.def_array)));
        
        RL=Goal('label',"Return Loss",...
            'f_array',TwoPortGoal.def_array,...
            'goal',zeros(1,length(TwoPortGoal.def_array)));
       
        
    end
    
    methods
        
        function obj=TwoPortGoal(varargin)
            % if no argument is passed, initialize TwoPortGoal
            % with default f_array ( 0.5:0.01:1.5 )
            % and default goal values 
            % else read arrays
            if ~isempty(varargin)
                
%                 obj.defaultgoal;
                
                for i=1:length(varargin)
                    
                    if ischar(varargin{i}) || isstring(varargin{i})
                        
                        switch varargin{i}

                            case 'f_array'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.f_array=varargin{i+1};

                                        obj.IL.set_f_array(obj.f_array);

                                        obj.ISO.set_f_array(obj.f_array);

                                        obj.RL.set_f_array(obj.f_array);

                                    end

                                end

                            case 'IL'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.IL.set_goal(varargin{i+1});

                                    end

                                end

                            case 'ISO'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.ISO.set_goal(varargin{i+1});

                                    end

                                end

                            case 'RL'

                                if ~isempty(varargin{i+1})

                                    if isnumeric(varargin{i+1})

                                        obj.RL.set_goal(varargin{i+1});

                                    end

                                end

                        end
                        
                    end
                    
                end
                
            end
                        
                
                    
        end
        
        function set_f_array(obj,newval,varargin)
            
            % sets the f_arrays for all goals
            
            if isempty(varargin)
                
                if length(newval)==length(obj.f_array)
                    
                    obj.IL.set_f_array(newval);
                    obj.ISO.set_f_array(newval);
                    obj.RL.set_f_array(newval);
                    
                end
                
            else
                
                if strcmp(varargin{i},'override')
                    
                    obj.IL.set_f_array(newval,'override');
                    obj.ISO.set_f_array(newval,'override');
                    obj.RL.set_f_array(newval,'override');
                    
                end
                
            end
            
        end
        
    end
      
end
    
