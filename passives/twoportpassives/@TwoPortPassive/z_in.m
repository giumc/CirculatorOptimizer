function imp = z_in(m, z0, freq)

    % imp = z_in(objz0, freq) 
    % z0 is of type OnePortPassive

    m_tot=m*z0.shuntABCD(freq);

    [a,~,c,~]=ABCD_split(m_tot);

    imp = a/c;

end
