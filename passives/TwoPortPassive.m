classdef (Abstract) TwoPortPassive < handle
   
    properties 
       
        ref_impedance=50;
        
    end
        
    methods (Abstract)
        
        m = ABCD (obj,freq)
        
    end

    methods 
    
        function m = multiABCD(obj,freqs)

                for k=1:length(freqs)

                    m = obj.m(freqs(k));

                    a(k) = m(1,1);
                    b(k) = m(1,2);
                    c(k) = m(2,1);
                    d(k) = m(2,2);

                end

                m = [ diag(a) diag(b) ; diag(c) diag(d) ];

        end

    end
    
end
