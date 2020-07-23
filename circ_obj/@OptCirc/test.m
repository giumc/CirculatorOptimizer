function test (obj)

    f_test_old=obj.f_test;
    
%     f_test=obj.f_center;
    
    obj.order=2;
    
    obj.f_test=obj.f_center;
    
    obj.calculate_S_lin_response;
    
    cold=circ(2);

    cold.modratio=0.1;
    cold.moddepth=0.1;
    cold.design.cell(1).q=20;
    cold.design.cell(2).q=20;
    
    obj.mod_depth.set_value(0.1,'override');
    obj.mod_freq.set_value(0.1,'override');
    obj.nlres.q_loaded.set_value(20,'override');
    obj.passive.resonators.q_loaded.set_value(20,'override');

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
    clc
    
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
    keyboard
    
    obj.f_test=f_test_old;
    
end
