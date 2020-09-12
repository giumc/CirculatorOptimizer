function m=ABCD(obj,freq)

    %Microstrip implementation
    
    beta=obj.get_prop_const(freq);
    
    length=obj.length;
    
    ph=beta*length;
    
    a=cos(ph);
    
    b=1i*obj.get_Z_line*sin(ph);
    
    c=1i*(1/obj.get_Z_line)*sin(ph);
    
    d=a;
    
    m= [a b ; c d];

end
