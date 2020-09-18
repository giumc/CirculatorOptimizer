function ret=get_z_params(obj,freq)

    [a,b,c,d]=ABCD_split(obj.ABCD(freq));
    
    z11=a/c;
    z12=(a*d-b*c)/c;
    z21=inv(c);
    z22=d/c;
    
    ret=[z11 z12; z21 z22] ;

end
