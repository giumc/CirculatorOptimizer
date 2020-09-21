function solve_for_Z(obj,Z_e,Z_o,freq,varargin)

    %CoupledMicrostrip implementation

    opts=optimoptions('fsolve');
    
    opts.Display='none';
    
    newobj=copy(obj);
    
    x0=[newobj.get_width('mil'),newobj.get_spacing('mil')];
    
    [sol,~,flag]=fsolve(@objective_fun,x0,opts);
    
    if flag==1
        
        fprintf("\nSolution Found for Z_e and Z_o!\n\n");
        
        set_if_valid(varargin,0,@(x) optional_print);
    
        obj.set_width(sol(1),'mil');
        
        obj.set_spacing(sol(2),'mil');
        
    else
        
        fprintf("\nSolution not found!\n\n");
        
    end
    
    function y=objective_fun(x)
    
        newobj.set_width(x(1),'mil');
        
        newobj.set_spacing(x(2),'mil');
        
        y(1)=newobj.get_Z_even(freq)-Z_e;
        
        y(2)=newobj.get_Z_odd(freq)-Z_o;
    
    end

    function optional_print()
    

        fprintf("\tW\t=\t%.2f mil \n\tS\t=\t%.2f mil\n",sol(2),sol(1));

        fprintf("Give\n");

        fprintf("\tZ_e\t=\t%.3f Ohm ( target %.3f Ohm)\n",...
            newobj.get_Z_even,Z_e);

        fprintf("\tZ_o\t=\t%.3f Ohm ( target %.3f Ohm)\n\n",...
            newobj.get_Z_odd,Z_o);

    
    end

end
