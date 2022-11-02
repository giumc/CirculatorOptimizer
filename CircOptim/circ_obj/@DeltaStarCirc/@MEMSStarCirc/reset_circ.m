function reset_circ(obj)

    %implementation for MEMSStarBranch
    
    obj.bandwidth=obj.def_kt2*6/pi/pi;
    
    obj.calculate_ftest;
    obj.calculate_goals;
    
    def_f_center=obj.f_center;
    def_q_loaded=5;
    
    def_kt2=obj.def_kt2;
    
    def_q_u=obj.def_q_u;
    
    obj.nlres.f_center.set_value(def_f_center,'override');
    obj.nlres.q_loaded.set_value(def_q_loaded,'override');
    obj.nlres.q_unloaded.set_value(def_q_u,'override');
    
    obj.mod_freq.set_value(obj.def_mod_freq,'override');
    obj.mod_depth.set_value(obj.def_mod_depth,'override');
    
    obj.passive.set_f_c(def_f_center);
    
    obj.passive.set_kt2(def_kt2);
    
    obj.passive.set_q_u(def_q_u);
    
    obj.passive.update_filt;
    
    obj.update_plot;

end
