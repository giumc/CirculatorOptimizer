function s = S_param_linear(obj,z0,freq)
        
    stot = obj.S_param(z0,freq);

    fundindex =(length(freq)+1)/2;

    [s11, s12, s21, s22] = ABCD_split(stot);

    s = [ s11(fundindex,fundindex) s12(fundindex,fundindex);...
          s21(fundindex,fundindex) s22(fundindex,fundindex)] ; 

end
