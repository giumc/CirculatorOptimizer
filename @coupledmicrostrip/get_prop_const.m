function gamma=get_prop_const(obj,freq,varargin)

    %CoupledMicrostrip implementation
    
    l=obj.get_length;
    
    Z_e=obj.get_Z_even;
    
    Z_o=obj.get_Z_odd;
    
    v_e=obj.c_0/sqrt(obj.get_epsilon_even);
    v_o=obj.c_0/sqrt(obj.get_epsilon_odd);
        
    k_e=2*pi*freq/v_e;
    k_o=2*pi*freq/v_o;
    
    opts=optimoptions('lsqnonlin');
    opts.Display='None';
    opts.StepTolerance=1e-9;
    opts.FunctionTolerance=1e-9;
    
    beta_0=2*pi/obj.c_0*sqrt(obj.get_epsilon_eff)*freq;
    
%     gamma_0=[0,beta_0];
    gamma_0=beta_0;
    
    min_lambda=1e-9;
    
    max_lambda=1e9;
    
    betabounds=2*pi./[max_lambda min_lambda];
    
%     alphabounds=[-1e-6 0];
%     
%     problem.lb=[alphabounds(1) betabounds(1)];
%     problem.ub=[alphabounds(2) betabounds(2)];
%     
    
    problem.lb=betabounds(1);
    problem.ub=betabounds(2);
    
    problem.options=opts;
    problem.objective=@(x) prop_function(x);
    problem.x0=gamma_0;
    problem.solver='lsqnonlin';
    
    sol=lsqnonlin(problem);
    
    gamma=sol;
    
    function ret=prop_function(x)
        
%         gamma=x(2)+1i*x(1);

            gamma=x;
           
        ret=(cos(gamma)-((Z_e/Z_o)-tan(k_e*l)*tan(k_o*l))/((Z_e/Z_o)+tan(k_e*l)*tan(k_o*l)))^2;
        
        ret=[real(ret) imag(ret)];
    end
    
end
