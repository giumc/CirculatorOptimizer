function init_goal(obj,varargin)

    %implementation for CircGoal
    
    init_goal@TwoPortGoal(obj,varargin{:});

    if ~isempty(varargin)

        for i=1:length(varargin)

            if isstring(varargin{i})||ischar(varargin{i})

                switch varargin{i}

                    case 'bandwidth'

                        obj.bandwidth=varargin{i+1};

                    case 'direction'

                        obj.direction=varargin{i+1};
                        
                    case 'order'
                        
                        obj.order=varargin{i+1};

                end

            end

        end

    end

end
