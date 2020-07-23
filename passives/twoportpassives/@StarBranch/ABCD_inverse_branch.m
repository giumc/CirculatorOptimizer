function m=ABCD_inverse_branch(obj,freq)

    m=ABCD_inverse(obj.nlres.seriesABCD(freq));
    
    if ~isempty(obj.passive)
        
        m= m*ABCD_inverse(obj.passive.ABCD(freq));
        
    end

end
