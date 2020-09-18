function m=ABCD(obj,freq)

    %implementation for OPtBandPassFilt
    m=diag(ones(1,2*length(freq)));
    
    for i=1:length(obj.resonators)
       
        if isa(obj.resonators(i),'OptParalRes')
            
            m=m*obj.resonators(i).shuntABCD(freq);
            
        else
            
            if isa(obj.resonators(i),'OptSeriesRes')
                
                m=m*obj.resonators(i).seriesABCD(freq);
                
            else
                
                error("Invalid resonator in OptBandPassFilt");
                
            end
            
        end
        
    end
    
end
