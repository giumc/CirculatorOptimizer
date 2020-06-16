function imt=IMtones(c,frf)
    
    % returns array of inter-modulation tones generated when 
    % frf is mixed with the harmonics of the circulator
    imt=zeros(c.n_freqs,1);

    index=-c.harmonics:c.harmonics;

    for k=1:c.n_freqs

        imt(k)=frf+index(k)*c.modratio.value*c.f_center;

        if abs(imt(k))<0.125
            imt(k)=sign(imt(k))*0.125;
        end

    end

end
