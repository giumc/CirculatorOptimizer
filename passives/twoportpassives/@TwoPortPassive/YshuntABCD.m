function m=YshuntABCD(y)

    a = diag(ones (1,length(y)));
    b = diag(zeros(1,length(y)));
    c = y;
    d = diag(ones (1,length(y)));

    m= [ a b ; c d];


end
