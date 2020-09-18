function init_goal(obj,varargin)

    if ~isempty(varargin)

        for i = 1 : length(varargin)

            if ischar(varargin{i}) || isstring(varargin{i})

                switch varargin{i}

                    case 'f_array'

                        if ~isempty(varargin{i+1})

                            if isnumeric(varargin{i+1})

                                obj.f_array=varargin{i+1};

                            end

                        end

                    case 'goal'

                        if ~isempty(varargin{i+1})

                            if isnumeric(varargin{i+1})

                                obj.goal=varargin{i+1};

                            end

                        end

                    case 'label'

                        if ~isempty(varargin{i+1})

                            if isstring(varargin{i+1})

                                obj.label=varargin{i+1};

                            else

                                if ischar(varargin{i+1})

                                    obj.label=string(varargin{i+1});

                                end

                            end

                        end

                end

            end

        end

    end

end
