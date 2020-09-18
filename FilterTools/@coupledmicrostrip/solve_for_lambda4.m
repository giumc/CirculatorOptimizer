function solve_for_lambda4(obj,freq)

    lambda=2*pi/obj.get_prop_const(freq);
    
    obj.set_length(lambda/4,'metre');
    
    l=obj.get_length('mil');

    fprintf("Found length is %.3f mils\n\n",l);
    
end
