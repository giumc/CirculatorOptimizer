classdef microstrip < handle
    
    properties (Constant)
        epsilon_0=8.85418e-12;
        c_0=299.7e6;
    end
        
    properties 
        units='mil';
        width=50;
        length=500;
        metalthickness=1.4;
        thickness=62;
        epsilon_r=1;
    end
    
    properties (Dependent)
        epsilon_eff;
        Z_line;
        epsilon_tot;
    end
    
    methods
        function obj=microstrip(varargin)
            if isempty(varargin)
            else
                init_microstrip(obj,varargin{:}); 
            end   
        end
    end
    
    methods 
        init_microstrip(microstrip,varargin);
    end
    
    methods
        function epsilon_eff=get.epsilon_eff(microstrip)
            epsilon_eff=calc_microstrip_eps_r(microstrip);
        end
        function Z_line=get.Z_line(obj)
            Z_line=calc_microstrip_Z_line(obj);
        end
        function epsilon_tot=get.epsilon_tot(obj)
            epsilon_tot=obj.epsilon_0*obj.epsilon_r;
        end
    end
end
