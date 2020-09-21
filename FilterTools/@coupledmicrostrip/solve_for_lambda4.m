function solve_for_lambda4(obj,freq,varargin)

    lambda=2*pi/obj.get_prop_const(freq);
    
    obj.set_length(lambda/4,'metre');
    
    l=obj.get_length('mil');
    
    fprintf("\nSolution Found for l=lambda/4!\n\n");

    set_if_valid(varargin,0,@(x) optional_print);
    
    function optional_print()
    
        fprintf("Found length is %.3f mils\n\n",l);
        
    end
    
end
