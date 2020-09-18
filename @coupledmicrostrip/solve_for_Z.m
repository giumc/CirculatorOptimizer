function solve_for_Z(obj,Z_e,Z_o)
    
    opts=optimoptions('fsolve');
    
    opts.Display='none';
    
    newobj=copy(obj);
    
    x0=[newobj.get_width,newobj.get_spacing]/newobj.mil_to_metre;
    
    [sol,~,flag]=fsolve(@objective_fun,x0,opts);
    
    if flag==1
        
        fprintf("\nSolution Found!\n\n");
        
        fprintf("\tW\t=\t%.2f mil \n\tS\t=\t%.2f mil\n",sol(2),sol(1));
        
        fprintf("Give\n");
        
        fprintf("\tZ_e\t=\t%.3f Ohm ( target %.3f Ohm)\n",...
            newobj.get_Z_even,Z_e);
        
        fprintf("\tZ_o\t=\t%.3f Ohm ( target %.3f Ohm)\n\n",...
            newobj.get_Z_odd,Z_o);
        
        obj.set_width(sol(2));
        
        obj.set_spacing(sol(1));
        
    else
        
        fprintf("\nSolution not found!\n\n");
        
    end
    
    function y=objective_fun(x)
    
        newobj.set_spacing(x(1));
        newobj.set_width(x(2));
        
        y(1)=newobj.get_Z_even-Z_e;
        y(2)=newobj.get_Z_odd-Z_o;
    
    end

end
