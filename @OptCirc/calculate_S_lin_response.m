function s_f = calculate_S_lin_response(obj)
        
    s_f = zeros(2,2,length(obj.f_test));

    for i=1:length(obj.f_test)
        
        freqs=IMtones(obj.f_test(i),obj.design.nlres.var.mod_freq.value,...
            obj.harmonics);
        
        s_f(:,:,i) = obj.S_param_linear(...
            obj.load,freqs);
        
    end

    obj.s_f=s_f;

end
