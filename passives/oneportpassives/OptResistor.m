classdef OptResistor <  OnePortPassive & OptParam 
    
   % optimizable resistor
   properties (Access=private,Constant)
       
       def_res=1;
       
   end
   
   methods
      
        function obj=OptResistor(varargin)
            
            if isempty(varargin)
                
                varargin={OptResistor.def_res};
                
            end
            
            obj=obj@OptParam(varargin{:});

            obj.unit='Ohm';
            
            obj.label='Resistor';
            
        end
       
        function imp=z(obj,freq)
                
            imp=diag(obj.value*ones(1,length(freq)));
            
        end
       
        function adm=y(obj,freq)
        
            adm =inv(obj.z(freq));
            
        end
        
   end
   
end
