function m=ABCD(obj,freq)

    %implementation for OPtMEMSBPFilt
    
    m=diag(ones(1,2*length(freq)));
    
    n=obj.order;
    
    switch obj.lastres
        
        case 'series_res'
        
            for i=1:length(obj.resonators)

                switch mod(n-i,2)

                    case 0

                        m=m*obj.resonators(i).seriesABCD(freq);

                    case 1

                        m=m*obj.resonators(i).shuntABCD(freq);

                end

            end
            
        case 'shunt_res'
            
            for i=1:length(obj.resonators)

                switch mod(n-i,2)

                    case 0

                        m=m*obj.resonators(i).shuntABCD(freq);

                    case 1

                        m=m*obj.resonators(i).seriesABCD(freq);

                end

            end
            
    end
        
end
