function m = ABCD_term(obj, m, z0, freq)
    %m = multiABCD_term(m,z0,freq)
    % z0 is of type OnePortPassive
    adm_eq = obj.y_in(m,z0,freq);

    a = diag(ones (1,length(adm_eq)));
    b = diag(zeros(1,length(adm_eq)));
    c = adm_eq;
    d = diag(ones (1,length(adm_eq)));

    m= [ a b ; c d];

end
