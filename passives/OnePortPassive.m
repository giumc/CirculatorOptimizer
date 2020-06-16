classdef (Abstract) OnePortPassive < handle & matlab.mixin.Heterogeneous
   
    % interface for oneport passive components
    % classes who inherit OnePortPassive must define
    % z(obj,freq) and y(obj,freq)
    
    methods (Abstract)
        
        imp=z(obj,freq);
        adm=y(obj,freq);
        
    end
    
    methods 
       
        function m = seriesABCD(obj, freq)
            m=zeros(2,2);
            m(1,1)=1;
            m(1,2)=obj.z(freq);
            m(2,1)=0;
            m(2,2)=1;
        end
        
        function m = shuntABCD(obj, freq)
            m=zeros(2,2);
            m(1,1)=1;
            m(1,2)=0;
            m(2,1)=obj.y(freq);
            m(2,2)=1;
        end
       
    end
       
    methods (Static)

        function m = multiABCD(freqs, fun)

                for k=1:length(freqs)

                    m = fun(freqs(k));

                    a(k) = m(1,1);
                    b(k) = m(1,2);
                    c(k) = m(2,1);
                    d(k) = m(2,2);

                end

                m = [ diag(a) diag(b) ; diag(c) diag(d) ];

        end

    end

end

