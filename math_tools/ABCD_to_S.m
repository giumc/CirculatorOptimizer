function s=ABCD_to_S(m,z0)

    % formulas derived for generic multiharmonic abcd matrices 
    % in Mathematica

    [ a ,b ,c ,d] = ABCD_split(m);
    
    [nfreq,~]=size(a);
    
    Id=diag(ones(1,nfreq));
    
    z0=z0*Id;
    
    y0=inv(z0);
    
    x = b +a*z0;
    
    delta = y0 + d / x + c * z0 / x;
    
    epsilon = c - d * y0 + y0 * a - y0 * b * y0; %#ok<*MINV>
    
    s11=-Id+2*Id/delta*y0;
    
    s12= a-b*y0-delta\epsilon;
    
    s21= 2*Id*z0/x/delta*y0;
    
    s22=-z0/x/delta*epsilon; %check distribution
    
    s=[s11 s12;s21 s22];
    
end


