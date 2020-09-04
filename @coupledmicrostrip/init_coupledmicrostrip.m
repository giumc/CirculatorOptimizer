function init_coupledmicrostrip(coupledmicrostrip,varargin)

    spacing={'spacing','Spacing','space','Space','s'};
    for i=1:length(varargin)
        if any(strcmp(varargin{i},spacing))
            if isnumeric(varargin{i+1})
                coupledmicrostrip.spacing=varargin{i+1};
            end
        end
    end
end
