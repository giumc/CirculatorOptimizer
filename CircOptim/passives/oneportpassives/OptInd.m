classdef OptInd< OptParam & OnePortPassive
    
   % optimizable capacitor
   properties (Access=private,Constant)
       def_ind=1e-9;
   end
   
   methods
      
        function obj=OptInd(varargin)

            obj=obj@OptParam(varargin{:});

            obj.unit='Henry';
            
            obj.label='Ind';
            
        end
       
        function imp=z(obj,freq)
            imp =diag( (1i * 2 * pi * freq *obj.value ));
        end
       
        function adm=y(obj,freq)
            adm = inv(obj.z(freq));
        end
       
   end
   
end
