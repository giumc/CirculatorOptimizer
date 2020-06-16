classdef OptParalRes < OnePortRes
    
   % optimizable parallel resonator
   % has two opt_param instances : f_center and q_loaded
   % both values can be set from constructor as name value pairs
   % the rest can be set by accessing the object
   % 
   % (public) properties
   % ref_impedance (double)
   % f_center (opt_param)
   % q_loaded (opt_param)
   % q_unloaded (opt_param)
   % 
   % methods
   % OptParalRes('f_center',1,'q_loaded',3,'q_unloaded',100)
   % z(freq)
   % y(freq)   
   % l
   % c
   
    properties 
       
       label="ParallelResonator";
       
   end
   
    methods

        function obj=OptParalRes(varargin)
            obj=obj@OnePortRes(varargin{:});
        end
        
        function val=l(obj)
            val=1./(2*pi*obj.f_center.value)^2/obj.c;
        end
        
        function val=c(obj)
            val=obj.q_loaded.value*obj.ref_impedance*(2*pi*obj.f_center.value);
        end

        function adm=y(obj,freq)
            adm=1i*2*pi*freq*obj.c+...
                1./(1i*2*pi*freq*obj.l)+...
                (2*pi*obj.f_center.value*obj.c)/obj.q_unloaded;
        end
        
        function imp=z(obj,freq)
            imp=1./obj.y(freq);
        end
        
    end
    
end
