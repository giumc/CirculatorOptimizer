function test (obj)

    %f_test=obj.f_center;
    
    obj.order=1;
    
    obj.f_test=obj.f_center;

    cold=circ(1);

    cold.f=1;

    mod_depth=cold.moddepth;
    mod_ratio=cold.modfreq;

    q_l=cold.design.cell.q;

    obj.nlres.var.mod_depth.set_value(mod_depth,'override');
    obj.nlres.var.mod_freq.set_value(mod_ratio,'override');
    obj.nlres.q_loaded.set_value(q_l,'override');

    cold.responsecalc;

%     mold_branch=cold.ABCD.branch;
%     mold_branchrev=cold.ABCD.branchrev;
%     mold_toground=cold.ABCD.shuntdyn;
%     mold_tot=cold.ABCD.tot;
% 
%     farray=IMtones(obj.f_center,mod_ratio,1);
% 
%     obj.design.nlres.var.mod_phase.set_value(0,'override');
%     
%     mnew_branch=obj.design.nlres.seriesABCD(farray);
%     obj.design.nlres.var.mod_phase.set_value(120,'override');
% 
%     mnew_togroud=obj.design.ABCD_term(obj.load,farray,2);
%     obj.design.nlres.var.mod_phase.set_value(240,'override');
% 
%     mnew_branchrev=ABCD_inverse(obj.design.ABCD(farray));
%     mnew_tot=obj.ABCD(farray);
    
    sold=cold.sparam;
    snew=obj.calculate_S_lin_response;
    
    sold.fund
    snew

end
