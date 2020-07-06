function adm = y_in(m, z0, freq)
    % adm = y_in(obj,z0, freq,port) 
    % z0 is of type OnePortPassive

    m_tot=m*z0.shuntABCD(freq);  
    
    [a,~,c,~]=ABCD_split(m_tot);

    adm = c/a;
    
end
