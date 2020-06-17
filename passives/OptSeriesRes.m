classdef OptSeriesRes < OnePortRes
    
   % optimizable series resonator
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
   % OptSeriesRes('f_center',1,'q_loaded',3,'q_unloaded',100)
   % z(freq)
   % y(freq)   
   % l
   % c
      
    methods

        function obj=OptSeriesRes(varargin)
            
            obj=obj@OnePortRes(varargin{:});
            obj.label="SeriesResonator";
        end
                   
        function ind=l(obj)
            ind=obj.q_loaded.value*obj.ref_impedance/(2*pi*obj.f_center.value);
        end
        
        function cap=c(obj)
            cap=1/(2*pi*obj.f_center.value)^2/obj.l;
        end

        function imp=z(obj,freq)
            imp=1i*2*pi*freq*obj.l+...
                1./(1i*2*pi*freq*obj.c)+...
                (2*pi*obj.f_center.value*obj.l)/obj.q_unloaded.value;
        end
        
        function adm=y(obj,freq)
            adm = inverse(obj.z(freq));
        end
        
        function res=r(obj)
            res = (2*pi*obj.f_center.value*obj.l)/obj.q_unloaded.value;
        end
        
    end
    
end
