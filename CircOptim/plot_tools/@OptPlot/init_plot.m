function init_plot(obj,varargin)

    if ~isempty(varargin)

            for i=1:length(varargin)

                if isa(varargin{i},'char')||isa(varargin{i},'string')

                    switch varargin{i}

                        case 'type'

                            obj.type=varargin{i+1};

                        case 'label'

                            obj.label=varargin{i+1};

                    end

                end

            end

    end

end
