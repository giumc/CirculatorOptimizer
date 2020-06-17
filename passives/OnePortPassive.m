classdef (Abstract) OnePortPassive < handle & matlab.mixin.Heterogeneous
   
    % interface for oneport passive components
    % classes who inherit OnePortPassive must define
    % methods:
    % z(obj,freq) 
    % y(obj,freq)
    % 
    % OSS z and y have to handle frequency arrays
       
    methods (Abstract)
        
        imp=z(obj,freq);
        adm=y(obj,freq);
        
    end
    
    methods 
       
        function m = seriesABCD(obj, freq)
            
            nfreq=length(freq);
            
            a=ones(nfreq);
            b=diag(obj.z(freq));
            c=zeros(nfreq);
            d=ones(nfreq);
            
            m= [ a b ; c d];
            
        end
        
        function m = shuntABCD(obj, freq)
            
            nfreq=length(freq);
            
            a=ones(nfreq);
            b=zeros(nfreq);
            c=diag(obj.y(freq));
            d=ones(nfreq);
            
            m= [ a b ; c d];
        end     

    end

end

