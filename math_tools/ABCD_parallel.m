function m = ABCD_parallel(m1,m2)

    [a1, b1, c1, d1]=ABCD_split(m1);
    [a2, b2, c2, d2]=ABCD_split(m2);

    [xdim,~]=size(a1);

    Id=diag(ones(1,xdim));

    x= pinv(Id-a1+b1/b2);
    
    a = (Id-x*(Id-a1))*a2; 

    b = x * b1;

    c = c1+c2-(d2/b2-d1/b2*x*(1-a1))*a2;

    d = d1*(1-b2\x*b1);

    m= [a b ; c d];

end
