function init_microstrip(microstrip,varargin)

widths={'w','W','width','Width','WIDTH'};
lengths={'l','L','length','Length','LENGTH'};
eps_r={'eps_r','epsr','eps'};
thickness={'T','t','thickness','Thickness','THICKNESS'};
    for i=1:length(varargin)
        if any(strcmp(varargin{i},widths))
            if ~isempty(varargin{i+1})
                if isnumeric(varargin{i+1})
                    microstrip.width=varargin{i+1};
                end
            end
        end

        if any(strcmp(varargin{i},lengths))
            if ~isempty(varargin{i+1})
                if isnumeric(varargin{i+1})
                    microstrip.length=varargin{i+1};
                end
            end
        end

        if any(strcmp(varargin{i},eps_r))
            if ~isempty(varargin{i+1})
                if isnumeric(varargin{i+1})
                    microstrip.epsilon_r=varargin{i+1};
                end
            end
        end
        
        if any(strcmp(varargin{i},thickness))
            if ~isempty(varargin{i+1})
                if isnumeric(varargin{i+1})
                    microstrip.thickness=varargin{i+1};
                end
            end
        end

    end
end
