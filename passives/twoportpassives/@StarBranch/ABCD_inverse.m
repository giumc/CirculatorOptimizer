function m=ABCD_inverse(obj,freq)
    %StarBranch overloaded version of ABCD_inverse
    
    m=ABCD_inverse(obj.nlres.seriesABCD(freq));
    
    if ~isempty(obj.passive)
       
        m=m*ABCD_inverse(obj.passive.ABCD(freq));
        
    end

end
