function s=convert_ABCD_to_S(m,zterm)

    % formulas derived for generic multiharmonic abcd matrices 
    % in Mathematica

    [a ,b ,c ,d ] = ABCD_split(m);
    
    denom = ( a + b/zterm +c *zterm +d );     
    
    u = diag(ones(1,square_dim(a)));
    
    s11 = (a+b/zterm-c*zterm-d) / denom ;
    
    s12 = 2*u / denom ; 
    
    s21 = 2 / denom;
    
    s22 = (-a+b/zterm-c*zterm+d) / denom; 
    
    s= [ s11 s12 ; s21 s22];
   
end
