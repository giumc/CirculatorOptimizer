function m = ABCD(obj,freq)

    theta=obj.get_phase_lag(freq);
    
    Z_e=obj.get_Z_even;
    Z_o=obj.get_Z_odd;
    
    z11=-1i/2*(Z_e+Z_o)*cot(theta);
    z13=-1i*2*(Z_e-Z_o)*csc(theta);
    
    zmat=[z11 z13; z13 z11];
    
    m=obj.convert_Z_to_ABCD(zmat);

end
