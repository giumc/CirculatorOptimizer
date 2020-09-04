function init_coupledmicrostrip(obj,varargin)

    spacing_options={'spacing','Spacing','space','Space','s'};
    
    options={spacing_options};
    set_options={@(x) obj.set_spacing(x)};
    
    obj.init_microstrip(varargin{:});

    set_if_valid(varargin,options,set_options);
    
end
