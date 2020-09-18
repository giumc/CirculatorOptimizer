function inv=ABCD_inverse(mat)

    [a, b, c, d] = ABCD_split(mat);

    det = a * d - b *c ;

    nil = zeros( length(a) );


    inv=[det nil; nil det] \ ...
        [ d b ; c a];

end
