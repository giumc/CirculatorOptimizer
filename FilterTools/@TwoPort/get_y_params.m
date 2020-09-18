function ret=get_y_params(obj,freq)

    [a,b,c,d]=ABCD_split(obj.ABCD(freq));
    
    y11=d/b;
    
    y12=(b*c-a*d)/b;
    
    y21=-inv(b);
    
    y22=a/b;
    
    ret=[y11 y12; y21 y22];
    
end
