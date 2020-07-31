function flag=run_optim(obj)
%     clc

    problem.options = optimoptions('fmincon');

    problem.options.Display = 'iter-detailed';
    
    problem.options.MaxIterations = 50e3;
    
    problem.options.Algorithm = 'interior-point';
    
    problem.options.FiniteDifferenceType = 'central';
    
    problem.options.FunctionTolerance = 1e-3;
    
    problem.options.StepTolerance = 1e-5;
    
    problem.options.OutputFcn                   =@(x,y,z) obj.out_optim(x,y,z);
    
    problem.options.UseParallel = false;

    problem.objective = @(x) obj.error_function(x);

    problem.x0 = obj.get_opt_norm_values;
    
    problem.lb = zeros(1,length(problem.x0));
    
    problem.ub = ones(1,length(problem.x0));

    problem.solver = 'fmincon';

    obj.optimsetup = problem;

    obj.optimsetup.stop = 0;

    [xa,~,flag] = fmincon(obj.optimsetup);
    
    obj.update_opt_norm_values(xa);
    
    obj.plot_tools.update_plot;
    
end

