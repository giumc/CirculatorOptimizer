function imt=IMtones(frf,fm,harmonics)
    
    % imt=IMtones(frf,fm,harmonics)
    % returns array of inter-modulation tones generated when 
    % frf is mixed with the harmonics of fm
    
    imt=zeros(2*harmonics+1,1);

    index=-harmonics:harmonics;
    
    for k=1:length(index)

        imt(k)=frf+index(k)*fm;

        if abs(imt(k))<0.125
            imt(k)=sign(imt(k))*0.125;
        end

    end

end
