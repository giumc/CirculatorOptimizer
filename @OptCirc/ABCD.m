function m = ABCD(obj,freq)

        var = obj.design.nlres.var;

        var.mod_phase.set_value(obj.phases(1),'override');

        m = obj.design.ABCD(freq) ;

        var.mod_phase.set_value(obj.phases(2),'override');

        m = m * obj.design.ABCD_term(obj.load,freq,2);

        var.mod_phase.set_value(obj.phases(3),'override');

        m = m * ABCD_inverse(obj.design.ABCD(freq)) ;

end
