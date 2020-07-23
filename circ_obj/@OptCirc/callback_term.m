function callback_term(obj,~,~)

    new_value=obj.load.value;

    if ~isempty(obj.passive)

        obj.passive.set_ref_impedance(new_value);

    end

    obj.nlres.set_ref_impedance(new_value);

end
