classdef OptCap <  opt_param & OnePortPassive
    
   % optimizable capacitor
   properties (Access=private,Constant)
       def_cap=1e-12;
   end
   
   methods
      
        function obj=OptCap(varargin)

            obj=obj@opt_param(varargin{:});

            obj.unit='Farad';
            
            obj.label='Cap';
            
        end
       
        function imp=z(obj,freq)
            imp=1 ./ (1i * 2 * pi * freq *obj.value );
        end
       
        function adm=y(obj,freq)
            adm = 1./obj.imp(freq);
        end
       
   end
   
end
