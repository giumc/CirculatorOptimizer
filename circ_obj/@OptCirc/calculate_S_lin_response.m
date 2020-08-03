function s_f = calculate_S_lin_response(obj)
        
    s_f = zeros(2,2,length(obj.f_test));
    
    for i=1:length(obj.f_test)
        
        freqs=IMtones(obj.f_test(i),obj.mod_freq.value,...
            obj.harmonics);
                s_f(:,:,i) = S_param_linear(obj.ABCD(freqs),...
            obj.load.value);
        
    end

    obj.s_f=s_f;

end
