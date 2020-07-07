function m = ABCD(obj,freq)

        obj.mod_phase.set_value(obj.phases(1),'override');

        m = ABCD@StarBranch(obj,freq);

        obj.mod_phase.set_value(obj.phases(2),'override');
        
        m = m * obj.ABCD_term(...
            ABCD_inverse(ABCD@StarBranch(obj,freq)),obj.load,freq);

        obj.mod_phase.set_value(obj.phases(3),'override');

        m = m * ABCD_inverse(ABCD@StarBranch(obj,freq));

end
