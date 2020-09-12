function Z_line=get_Z_line(obj,varargin)

%all eqns are from Hong-Lancaster, Chap 4

vacuumeta=120*pi;

u=obj.width/obj.thickness;

eps_eff=obj.get_epsilon_eff(varargin{:});

    if ~isempty(varargin)

        switch varargin{1}

            case {'accurate','Hong-Lancaster'}

                Z_line=calc_accurate_Z_line();

            case {'simple','physical'}

                Z_line=calc_simple_Z_line();
                
            otherwise
                
                Z_line=calc_simple_Z_line();

        end

    else
        
        Z_line=calc_simple_Z_line();
        
    end
    
    function ret=calc_accurate_Z_line()

        F=6+(2*pi-6)*exp(-(30.666/u)^(0.7528));

        ret=vacuumeta/2/pi/sqrt(eps_eff)*log(F/u+sqrt(1+(2/u)^2));
        
    end
    
    function ret=calc_simple_Z_line()
        
        if u>=1
            
            ret=vacuumeta/2/pi/sqrt(eps_eff)*log(8/u+0.25*u);
            
        else
           
            ret=vacuumeta/sqrt(eps_eff)*(u+1.393+0.667*log(u+1.444))^(-1);
            
        end
           
    end

end
