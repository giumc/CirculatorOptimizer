function init_microstrip(obj,varargin)

    %set to default

    obj.set_width(obj.def_width);
    obj.set_length(obj.def_length);
    obj.set_epsilon_r(obj.def_epsilon_r);
    obj.set_thickness(obj.def_thickness);

    width_opts={'w','W','width','Width','WIDTH'};

    length_opts={'l','L','length','Length','LENGTH'};

    eps_r_opts={'eps_r','epsr','eps','epsilon_r'};

    thickness_opts={'T','t','thickness','Thickness','THICKNESS'};

    options={width_opts,length_opts,eps_r_opts,thickness_opts};

    set_functions={...
        @(x) obj.set_width(x),...
        @(x) obj.set_length(x),...
        @(x) obj.set_epsilon_r(x),...
        @(x) obj.set_thickness(x)};

    set_if_valid(varargin,options,set_functions);
    
    

end
