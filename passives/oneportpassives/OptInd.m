classdef OptInd< opt_param & OnePortPassive
    
   % optimizable capacitor
   properties (Access=private,Constant)
       def_ind=1e-9;
   end
   
   methods
      
        function obj=OptInd(varargin)

            obj=obj@opt_param(varargin{:});

            obj.unit='Henry';
            
            obj.label='Ind';
            
        end
       
        function imp=z(obj,freq)
            imp = (1i * 2 * pi * freq *obj.value );
        end
       
        function adm=y(obj,freq)
            adm = inverse(obj.z(freq));
        end
       
   end
   
end
