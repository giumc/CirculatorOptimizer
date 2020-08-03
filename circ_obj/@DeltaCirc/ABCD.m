function [m,varargout] = ABCD(obj,freq)

        %  refers to the DeltaCirc implementation
        
        obj.mod_phase.set_value(obj.phases(1),'override');

        m1 = ABCD@StarBranch(obj,freq);

        obj.mod_phase.set_value(obj.phases(2),'override');
        
        m2= obj.ABCD_inverse_branch(freq);
        
        m2=m2*obj.load.shuntABCD(freq);
        
        obj.mod_phase.set_value(obj.phases(3),'override');

        m3 = obj.ABCD_inverse_branch(freq);
        
        obj.mod_phase.set_value(obj.phases(1),'override');
        
        m = ABCD_parallel_v2(m1,m2*m3);
        
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
