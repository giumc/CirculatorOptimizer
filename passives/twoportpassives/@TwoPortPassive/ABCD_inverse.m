function m= ABCD_inverse(obj,freq)

    m= obj.ABCD(freq);
    
    m=ABCD_inverse(m);

end
