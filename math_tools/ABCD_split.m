function [a ,b ,c ,d ] = ABCD_split(mat)
            
    [xdim, ydim]= size(mat);

    if ~xdim==ydim

        error("Invalid Matrix to split");

    end

    nfreq= xdim/2;

    a=mat(1:nfreq,1:nfreq);
    b=mat(1:nfreq,(nfreq+1):(2*nfreq));
    c=mat((nfreq+1):(2*nfreq),1:nfreq);
    d=mat((nfreq+1):(2*nfreq),(nfreq+1):(2*nfreq));

end
