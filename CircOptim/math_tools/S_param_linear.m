function s = S_param_linear(m,z0)
        
%     stot = ABCD_to_S(m,z0);

    fundindex =(square_dim(m)/2+1)/2;
    
    [a,b,c,d]=ABCD_split(m);
    
%     m_lin=[...
%         a(fundindex,fundindex),...
%         b(fundindex,fundindex);...
%         c(fundindex,fundindex),...
%         d(fundindex,fundindex)];
%     
%     s=ABCD_to_S_v1(m_lin,z0);
    
    stot = ABCD_to_S_v1(m,z0);    

    [s11, s12, s21, s22] = ABCD_split(stot);

    s = [ s11(fundindex,fundindex) s12(fundindex,fundindex);...
          s21(fundindex,fundindex) s22(fundindex,fundindex)] ; 

end
