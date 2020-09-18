function m=ABCD_parallel_v2(m1,m2)

    y1 = ABCD_to_Y(m1);
    y2 = ABCD_to_Y(m2);
    
    ytot = y1+y2;
    
    m=Y_to_ABCD(ytot);

end
