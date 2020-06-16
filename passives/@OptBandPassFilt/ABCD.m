function m=ABCD(obj,freq)

    m=ones(2,2);
    
    for i=1:length(obj.resonators)
       
        if mod(i,2)==1
            
            m=m*obj.resonators(i).seriesABCD(freq);
            
        else
            
            m=m*obj.resonators(i).shuntABCD(freq);
            
        end
        
    end
    
end
