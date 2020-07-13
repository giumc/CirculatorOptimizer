function reset_circ(obj)

    obj.calculate_frf();

    obj.nlres.f_center.set_value(obj.f_center,'override');
    obj.nlres.q_loaded.set_value(1/2/obj.bandwidth,'override');
    
    obj.mod_freq.set_value(0.1,'override');
    obj.mod_depth.set_value(0.1,'override');
    
    if ~isempty(obj.passive)

        for i=1:length(obj.passive.resonators)

            obj.passive.resonators(i).f_center.set_value(obj.f_center,'override');
            obj.passive.resonators(i).q_loaded.set_value(1/2/obj.bandwidth,'override');

        end

    end

end
    
