classdef OptResistor <  opt_param & OnePortPassive
    
   % optimizable capacitor
   properties (Access=private,Constant)
       
       def_res=50;
       
   end
   
   methods
      
        function obj=OptResistor(varargin)

            obj=obj@opt_param(varargin{:});

            obj.unit='Ohm';
            
            obj.label='Resistor';
            
        end
       
        function imp=z(obj,freq)
                
            imp=obj.value*ones(1,length(freq));
            
        end
       
        function adm=y(obj,freq)
        
            adm = inverse(obj.z(freq));
            
        end
       
   end
   
end
