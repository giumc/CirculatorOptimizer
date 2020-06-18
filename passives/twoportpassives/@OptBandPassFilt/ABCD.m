function m=ABCD(obj,freq)

    m=diag(ones(1,2*length(freq)));
    
    for i=1:length(obj.resonators)
       
        if mod(i,2)==1
            
            m=m*obj.resonators(i).shuntABCD(freq);
            
        else
            
            m=m*obj.resonators(i).seriesABCD(freq);
            
        end
        
    end
    
end
