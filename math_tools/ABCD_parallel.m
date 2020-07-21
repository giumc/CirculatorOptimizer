function m = ABCD_parallel(m1,m2)

    [a1, b1, c1, d1]=ABCD_split(m1);
    [a2, b2, c2, d2]=ABCD_split(m2);

    [xdim,~]=size(a1);

    Id=diag(ones(1,xdim));

    a = a2+(Id+b1/b2)\(a1-a2);

    b = pinv(pinv(b1)+pinv(b2));

    c = c1+c2-d1/b2*(1+b1/b2)\(a2-a1)+d2/b2*(1+b1/b2)\(a1-a2);

    d = d2+(d1-d2)/(1+b2\b1);

    m= [a b ; c d];

end
