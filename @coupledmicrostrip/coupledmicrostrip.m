classdef coupledmicrostrip < handle
    
    properties
        
        line;
        
        spacing=10;
        
        units='mil';
        
    end
    
    properties (Dependent)
        
        Z_line_even;
        
        Z_line_odd;
        
        epsilon_eff_even;
        
        epsilon_eff_odd;
        
    end  
    
    methods % constructors
        
        function obj=coupledmicrostrip(varargin)
        
            if isempty(varargin)
                
                fprintf('Initialize default coupled microstrip');
                
                obj.line=microstrip();
                
            else
                
                obj.line=microstrip(varargin{:});
                
                init_coupledmicrostrip(obj,varargin{:});
                
            end
            
        end
        
    end
    
    methods %defined in the folder
        
        init_coupledmicrostrip(coupledmicrostrip,varargin);
        
    end
        
    methods %dependent props defined in the folder
        
        function Z_line_even=get.Z_line_even(coupledmicrostrip)
        
            Z_line_even=calc_coupledmicrostrip_Z_even(coupledmicrostrip);
            
        end
        
        function Z_line_odd=get.Z_line_odd(coupledmicrostrip)
        
            Z_line_odd=calc_coupledmicrostrip_Z_odd(coupledmicrostrip);
            
        end
        
        function epsilon_eff_even=get.epsilon_eff_even(coupledmicrostrip)
        
            epsilon_eff_even=calc_coupledmicrostrip_eps_eff_even(coupledmicrostrip);
            
        end
        
        function epsilon_eff_odd=get.epsilon_eff_odd(coupledmicrostrip)
           
            epsilon_eff_odd=calc_coupledmicrostrip_eps_eff_odd(coupledmicrostrip);
        
        end
        
    end
    
end
