function test (obj)

    f_test_old=obj.f_test;
    
%     f_test=obj.f_center;
    
    mod_freq=0.2;
    mod_depth=0.05;
    q=20;
    obj.order=1;
    
    obj.f_test=obj.f_center;
    
    obj.calculate_S_lin_response;
    
    cold=circ(1);
    
    cold.modratio=mod_freq;
    cold.moddepth=mod_depth;
    cold.design.cell(1).q=q;
    cold.design.cell(2).q=q;
    
    obj.mod_depth.set_value(mod_depth,'override');
    obj.mod_freq.set_value(mod_freq,'override');
    obj.nlres.q_loaded.set_value(q,'override');
%     obj.passive.resonators.q_loaed.set_value(20,'override');

    cold.f = obj.f_center;
    cold.responsecalc;
     
    mold_branch = cold.ABCD.branch;
    mold_branchrev=cold.ABCD.branchrev;
    mold_toground=cold.ABCD.shuntdyn.ABCDshuntEq;
    mold_tot=cold.ABCD.tot;
 
    farray = IMtones(obj.f_center,obj.mod_freq.value,obj.harmonics);
 
    obj.mod_phase.set_value(0,'override');
     
    [mtot,mnew_branch,mnew_toground,mnew_branchrev]= obj.ABCD(farray);

    mold_branch-mnew_branch
    keyboard
    
    mold_toground-mnew_toground
    clc
    
    mold_branchrev - mnew_branchrev
    clc
    
    mold_tot - mtot
    clc
    
    sold=cold.sparam;
    snew=obj.calculate_S_lin_response;
    
    sold.fund
    snew
    
    
    obj.f_test=f_test_old;
    
end
