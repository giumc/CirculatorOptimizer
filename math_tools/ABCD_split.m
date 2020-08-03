function [a ,b ,c ,d ] = ABCD_split(mat)
    
    [xdim,ydim]=size(mat);
    xdim=xdim/2;
    ydim=ydim/2;
    
    a=mat(1:xdim,1:ydim);
    b=mat(1:xdim,(ydim+1):(2*ydim));
    c=mat((xdim+1):(2*xdim),1:ydim);
    d=mat((xdim+1):(2*xdim),(ydim+1):(2*ydim));

end
