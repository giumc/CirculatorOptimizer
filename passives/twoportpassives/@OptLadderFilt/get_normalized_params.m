function g=get_normalized_params(obj,fc,fbw)

    % Ladder implementation
    if isempty(obj.resonators)
        
        g=NaN;
        
        return
        
    else

        for i=1:length(obj.resonators)
            
            g(i)=obj.resonators(i).get_normalized_param(fc,fbw);

        end
        
    end

end
