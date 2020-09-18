function imp = z_in(m)

    % imp = z_in(objz0, freq) 
    % z0 is of type OnePortPassive

%     m_tot=m*z0.shuntABCD(freq);

    [a,~,c,~]=ABCD_split(m);

    imp = a/c;

end
