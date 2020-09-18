function s = ABCD_to_S_v1(m, zterm) 

    [a ,b ,c ,d ] = ABCD_split(m);
    
    denom = ( a + b/zterm +c *zterm +d );     
    
    u = diag(ones(1,square_dim(a)));
    
    s11 = (a+b/zterm-c*zterm-d) / denom ;
    
    s21 = 2*u / denom ; 
    
    %calculate inverse from hand calculations
    
    m_conv2= [ a -b ; c -d];
    
    m_inv=diag(ones(1,2*square_dim(a)))/m_conv2;
    
    [a ,b ,c ,d ] = ABCD_split(m_inv);
    
    denom = ( a - b/zterm +c *zterm -d );   
    
    s22 = (a-b/zterm-c*zterm+d) / denom ;
    
    s12 = 2*u / denom ; 
    
    s= [ s11 s12 ; s21 s22];
    
end
