classdef OptParalRes < OnePortRes
    
    methods

        function obj=OptParalRes(varargin)
            obj=obj@OnePortRes(varargin{:});
            obj.label="ParallelResonator";
        end
        
        function val=l(obj)
            val=1./(2*pi*obj.f_center.value)^2/obj.c;
        end
        
        function val=c(obj)
            val=obj.q_loaded.value/obj.ref_impedance/(2*pi*obj.f_center.value);
        end
        
        function res= r(obj)
            adm = (2*pi*obj.f_center.value*obj.c)/obj.q_unloaded.value;
            res= 1./adm;
        end

        function adm=y(obj,freq)
            adm=diag(1i*2*pi*freq*obj.c+...
                1./(1i*2*pi*freq*obj.l)+...
                (2*pi*obj.f_center.value*obj.c)/obj.q_unloaded.value);
        end
        
        function imp=z(obj,freq)
            imp = inverse(obj.y(freq));
        end
        
    end
    
end
