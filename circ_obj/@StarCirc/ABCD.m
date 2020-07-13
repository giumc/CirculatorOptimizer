function [m,varargout] = ABCD(obj,freq)

        obj.mod_phase.set_value(obj.phases(1),'override');

        m1 = ABCD@StarBranch(obj,freq);
        m = m1;

        obj.mod_phase.set_value(obj.phases(2),'override');

        ygnd=obj.y_in(...
            ABCD_inverse(obj.nlres.seriesABCD(freq))*...
            ABCD_inverse(obj.passive.ABCD(freq))*...
            obj.load.shuntABCD(freq));
        
        m2=obj.YshuntABCD(ygnd);
        
        m = m * m2; 

        obj.mod_phase.set_value(obj.phases(3),'override');

        m3 = ABCD_inverse(obj.nlres.seriesABCD(freq))*...
            ABCD_inverse(obj.passive.ABCD(freq));
        
        m = m * m3;
        
        obj.mod_phase.set_value(obj.phases(1),'override');
        
        switch nargout - 1
            
            case 0
                
            case 1
                
                varargout={m1};
                
            case 2
                
                varargout={m1,m2};
                
            case 3
                
                varargout={m1,m2,m3};
                
            case 4
                
                varargout={m1,m2,m3,ygnd};
                
        end

end
