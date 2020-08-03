function y=ABCD_to_Y(m)

    [a,b,c,d]=ABCD_split(m);
    
    [xdim,~]=size(a);
    
    Id=diag(ones(1,xdim));
    
    y11 = d/b;
    
    y12 = -Id/b;
    
    y21 = c-(d/b)*a;
    
    y22 = b\a;
    
    y= [y11 , y12; y21, y22];

end

