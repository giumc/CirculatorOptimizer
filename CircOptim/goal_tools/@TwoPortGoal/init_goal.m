function init_goal(obj,varargin)

    % implementation for TwoPortGoal
    
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
