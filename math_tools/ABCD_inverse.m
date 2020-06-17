function inv=ABCD_inverse(mat)

    [a b c d] = split_ABCD(mat);

    det = a * d - b *c ;

    nil = zeros( length(a) );


    inv=[det nil; nil det] \ ...
        [ d b ; c a];

end
