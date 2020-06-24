classdef OptResistor <  OnePortPassive & opt_param 
    
   % optimizable resistor
   properties (Access=private,Constant)
       
       def_res=1;
       
   end
   
   methods
      
        function obj=OptResistor(varargin)
            
            if isempty(varargin)
                
                varargin={OptResistor.def_res};
                
            end
            
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
