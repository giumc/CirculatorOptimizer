function m = ABCD_parallel(m1,m2)

    [a1, b1, c1, d1]=ABCD_split(m1);
    [a2, b2, c2, d2]=ABCD_split(m2);

    [xdim,~]=size(a1);

    Id=diag(ones(1,xdim));

    x= (Id+b1/b2);
    
    y= (Id+b2\b1);
    
    a = (1-Id/x)*a2+x\a1;
    
    b =b1*b2/(b1*b2/b1+b1);

    c = c1+c2-(d1-d2)/(b2*x)*(a1-a2);

    d = d2+(d1-d2)/y;

    m= [a b ; c d];

end
