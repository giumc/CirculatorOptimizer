function [m,varargout] = ABCD(obj,freq)

        % obj.ABCD_inverse refers to the WyeCirc implementation
        
        obj.mod_phase.set_value(obj.phases(1),'override');

        m1 = ABCD@StarBranch(obj,freq);

        obj.mod_phase.set_value(obj.phases(2),'override');

        m2=ABCD_inverse(obj.nlres.seriesABCD(freq));
    
        if ~isempty(obj.passive)

            m2=m2*ABCD_inverse(obj.passive.ABCD(freq));

        end
        
        m2=m2*obj.load.shuntABCD(freq);
        
        obj.mod_phase.set_value(obj.phases(3),'override');

        m3 = ABCD_inverse(obj.nlres.seriesABCD(freq));
           
        if ~isempty(obj.passive)

            m3=m3*ABCD_inverse(obj.passive.ABCD(freq));

        end
        
        obj.mod_phase.set_value(obj.phases(1),'override');
        
        m = ABCD_parallel(m1,m2*m3);
        
        switch nargout - 1
            
            case 0
                
            case 1
                
                varargout={m1};
                
            case 2
                
                varargout={m1,m2};
                
            case 3
                
                varargout={m1,m2,m3};
                
        end

end
