function m=convert_Z_to_ABCD(z)

    [z11,z12,z21,z22]=ABCD_split(z);
    
    [xdim,~]=size(z11);
    
    Id=diag(ones(1,xdim));
    
    det=z11*z22-z12*z21;
    
    a= z21\z11;
    
    b= det/(z21);
  
    c= Id/z21;
    
    d= z22/z21;
    
    m = [a b ; c d];

end
