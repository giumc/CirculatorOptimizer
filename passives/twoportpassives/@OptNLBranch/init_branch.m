function init_branch(obj,varargin)

    % version of the abstract class OptNLBranch
    
    obj.nlres.f_center.set_value(obj.def_f_c,'override');
    obj.nlres.q_loaded.set_value(obj.def_q_l,'override');
    obj.nlres.set_ref_impedance(obj.def_term);

end
