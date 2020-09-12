function epsilon_eff=get_epsilon_eff(obj,varargin)

    eps_r=obj.epsilon_r;

    u=obj.width/obj.thickness;

    %all eqns are from Hong-Lancaster, Chap 4

    if ~isempty(varargin)

        switch varargin{1}

            case {'accurate','Hong-Lancaster'}

                epsilon_eff=calc_accurate_eps();

            case {'simple','physical'}

                epsilon_eff=calc_simple_eps();

        end

    else
        
        epsilon_eff=calc_simple_eps();
        
    end
        

    function ret=calc_accurate_eps()
   
            a=1+1/49*log((u^4+(u/52)^2)/(u^4+0.432))+1/18.7*log(1+(u/18.1)^3);
            
            b=0.564*((eps_r-0.9)/(eps_r+3))^(0.053);

            ret=(eps_r+1)/2+(eps_r-1)/2*(1+10/u)^-(a*b);
    end

    function ret=calc_simple_eps()
    
        if u<=1
    
            ret=(eps_r+1)/2+(eps_r-1)/2*(1+12*u+0.04*(1-u)^2)^(-0.5);
        
        else
            
            ret=(eps_r+1)/2+(eps_r-1)/2*(1+12*u)^(-0.5);
            
        end
    
    end

end
