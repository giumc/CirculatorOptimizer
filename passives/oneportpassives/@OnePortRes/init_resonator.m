function init_resonator(obj,varargin)

    obj.f_center=OptParam('value',OnePortRes.def_f_c);

    obj.q_loaded=OptParam('value',OnePortRes.def_q_l);

    obj.q_unloaded=OptParam('value',OnePortRes.def_q_u);

    obj.f_center.rescale_factor=obj.def_f_rescale;

    obj.q_loaded.rescale_factor=obj.def_q_rescale;
    
    options={{'f','f_center','f_c'},...
        {'q','q_ref','q_l','q_loaded'},...
        {'q_u','qu','q_unloaded'},...
        {'ref_impedance','z_term','z_ref'},...
        {'label'}};
    
    set_functions={...
        @(x)obj.f_center.set_value(x,'override'),...
        @(x)obj.q_loaded.set_value(x,'override'),...
        @(x)obj.q_unloaded.set_value(x,'override'),...
        @(x)obj.set_ref_impedance(x),...
        @(x)set_label(x)};

    function set_label(x)
        obj.label=x;
    end

    set_if_valid(varargin,options,set_functions);
    
end
