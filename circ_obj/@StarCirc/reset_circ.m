function reset_circ(obj)

    obj.calculate_ftest;
    obj.calculate_goals;
    
    def_f_center=obj.f_center;
    def_q_loaded=1/obj.bandwidth;
    
    obj.nlres.f_center.set_value(def_f_center,'override');
    obj.nlres.q_loaded.set_value(def_q_loaded,'override');
    
    obj.mod_freq.set_value(0.01,'override');
    obj.mod_depth.set_value(0.01,'override');
    
    if ~isempty(obj.passive)

        for i=1:length(obj.passive.resonators)

            obj.passive.resonators(i).f_center.set_value(def_f_center,'override');
            obj.passive.resonators(i).q_loaded.set_value(def_q_loaded,'override');

        end

    end
    
    obj.update_plot;

end
    
