function init_res(obj,varargin)

    obj.f_center=OptParam('value',OnePortPiezoRes.def_f_c);

    obj.q_loaded=OptParam('value',0);
    
    obj.q_loaded.optimizable=false;

    obj.q_unloaded=OptParam('value',OnePortRes.def_q_u);
    
    obj.kt2=OptParam('value',obj.def_kt2);

    obj.ref_impedance=obj.def_z_term;
    
    obj.z_match=OptResistor('value',obj.def_z_match);
    
    obj.c0=OptCap('value',obj.c_match);
    
    obj.f_center.rescale_factor=obj.def_f_rescale;

    obj..rescale_factor=obj.def_q_rescale;

    obj.f_center('=OptParam('value',obj.def_f_res);

    obj.q_unloaded=OptParam('value',obj.def_q);

    
    obj.c0=OptParam('value',obj.def_c0);

end
