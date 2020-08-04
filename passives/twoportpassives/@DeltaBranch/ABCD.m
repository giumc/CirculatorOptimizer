function m=ABCD(obj,freq)

    % implementation for DeltaBranch
    
    m = obj.nlres.seriesABCD(freq);

    if ~isempty(obj.passive)

        m = obj.passive.ABCD(freq) * m;

    end

end
