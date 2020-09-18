function [m,rcondres] = ABCD_parallel(m1,m2)

    [a1, b1, c1, d1]=ABCD_split(m1);
    
    [a2, b2, c2, d2]=ABCD_split(m2);

    [xdim,~]=size(a1);

    Id=diag(ones(1,xdim));
    
%   vector forms

    x=Id+b1/b2;
    
    y=Id+b2\b1;
    
    a = a2+x\(a1-a2);
    
    b = Id/(pinv(b1)+pinv(b2));
    
    c = c1+c2-(((d1-d2)/b2)/x)*(a1-a2);
    
    d = d2+(d1-d2)/y;

%     m= [a b ; c d ];

    rcondres=min(rcond(Id/b1+Id/b2));
%     scalar forms

%     a = (a2*b1+a1*b2)/(b1+b2);
%     
%     b = (b1*b2)/(b1+b2);
%     
%     c = ((b1+b2)*(c1+c2)+(a2-a1)*(d1-d2))/(b1+b2);
%     
%     d = (d2*b1+d1*b2)/(b1+b2);
%         
    m= [a b ; c d ];

end
