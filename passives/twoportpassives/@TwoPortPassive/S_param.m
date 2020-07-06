function s = S_param(obj, z0, freq) 
            
    m = obj.ABCD(freq) ;

    zterm = z0.value ;

    [a ,b ,c ,d ] = ABCD_split(m);
    
    denom = ( a + b/zterm +c *zterm +d );     
    
    u = diag(ones(1,length(freq)));
    
    s11 = (a+b/zterm-c*zterm-d) / denom ;
    
    s21 = 2*u / denom ; 
    
    %calculate inverse from hand calculations
    
    m_conv2= [ a -b ; c -d];
    
    m_inv=inv(m_conv2);
    
    [a ,b ,c ,d ] = ABCD_split(m_inv);
    
    denom = ( a - b/zterm +c *zterm -d );   
    
    s22 = (a-b/zterm-c*zterm+d) / denom ;
    
    s12 = 2*u / denom ; 
    
    s= [ s11 s12 ; s21 s22];
    
end
