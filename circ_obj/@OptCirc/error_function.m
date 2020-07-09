function err=error_function(obj)
            
    s21=squeeze(obj.s_f(2,1,:));
    err_IL=obj.ILgoal.error_function(s21(obj.ILgoal.test_indexes));

    s12=squeeze(obj.s_f(1,2,:));
    err_ISO=obj.ISOgoal.error_function(s12(obj.ISOgoal.test_indexes));

    s11=squeeze(obj.s_f(1,1,:));
    err_RL1=obj.RLgoal.error_function(s11(obj.RLgoal.test_indexes));

    s22=squeeze(obj.s_f(2,2,:));
    err_RL2=obj.RLgoal.error_function(s22(obj.RLgoal.test_indexes));

    err_RL=(err_RL1+err_RL2)/2;

    err=err_IL+err_ISO+err_RL;

end
