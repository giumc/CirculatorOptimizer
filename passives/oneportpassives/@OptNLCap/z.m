function imp = z (obj,freq)

    adm=obj.y(freq);
    
    imp=pinv(adm);
    
end
