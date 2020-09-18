function imp = z (obj,freq)

    adm=obj.y(freq);
    
    imp=inv(adm);
    
end
