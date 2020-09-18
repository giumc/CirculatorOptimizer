function m=square_dim(x)

    m=0;
    
    [xdim,ydim]=size(x);
    
    if ~(xdim==ydim)
        
        error("nonSquareMatrix");
        
    else
        
        m=xdim;
        
    end

end
