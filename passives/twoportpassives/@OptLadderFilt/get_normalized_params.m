function g=get_normalized_params(obj,fc)

    % Ladder implementation
    if isempty(obj.resonators)
        
        g=NaN;
        
        return
        
    else

        for i=1:length(obj.resonators)
            
            g(i)=obj.resonators(i).get_normalized_param(fc);

        end
        
    end

end
