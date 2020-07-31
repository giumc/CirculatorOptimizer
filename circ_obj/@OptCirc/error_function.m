function err=error_function(obj,varargin)
    %if an array is passed, it is used to update the circ OptParams values

%     keyboard();
    
    if ~isempty(varargin)
        
        if isnumeric(varargin{1})
            
            newvals=varargin{1};
                       
            obj.update_opt_norm_values(newvals);
        
            obj.calculate_S_lin_response;
            
        end
        
    end
    
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
