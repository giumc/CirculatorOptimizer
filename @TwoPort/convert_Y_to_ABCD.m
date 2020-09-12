function m=convert_Y_to_ABCD(y)

    [y11,y12,y21,y22]=ABCD_split(y);
    
    [xdim,~]=size(y11);
    
    Id=diag(ones(1,xdim));
    
    a= -y21\y22;
    
    b= -Id/(y21);
  
    c= y12-(y11/y21)*y22;
    
    d= -y11/y21;
    
    m = [a b ; c d];

end
