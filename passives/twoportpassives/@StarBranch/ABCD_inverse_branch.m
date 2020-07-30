function m=ABCD_inverse_branch(obj,freq)

    m=obj.nlres.seriesABCD_inv(freq);
    
    if ~isempty(obj.passive)
        
        m= m*ABCD_inverse(obj.passive.ABCD(freq));
        
    end
    
end
