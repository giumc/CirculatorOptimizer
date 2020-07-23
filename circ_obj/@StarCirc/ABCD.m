function [m,varargout] = ABCD(obj,freq)

        % obj.ABCD_inverse refers to the StarCirc implementation
        
        obj.mod_phase.set_value(obj.phases(1),'override');

        m1 = ABCD@StarBranch(obj,freq);
        
        m = m1;

        obj.mod_phase.set_value(obj.phases(2),'override');

        m2=obj.YshuntABCD(...
            obj.y_in(...
                obj.ABCD_inverse_branch(freq)*...
                obj.load.shuntABCD(freq)));
        
        m = m * m2; 

        obj.mod_phase.set_value(obj.phases(3),'override');

        m3 =obj.ABCD_inverse_branch(freq);
        
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
                
        end

end
