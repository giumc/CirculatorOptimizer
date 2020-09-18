function imt=IMtones(frf,fm,harmonics)
    
    % imt=IMtones(frf,fm,harmonics)
    % returns array of inter-modulation tones generated when 
    % frf is mixed with the harmonics of fm
    
    imt=zeros(2*harmonics+1,1);

    index=-harmonics:harmonics;
    
    for k=1:length(index)

        imt(k)=frf+index(k)*fm;

    end
    
    %check for negative frequencies
    
    for i=1:length(imt)
       
        if abs(imt(i))<1e-3
            
            imt(i)=1e-3;
            
        else
            
            if imt(i)<0
                
                imt(i)=-imt(i);
                
            end
            
        end
        
    end

end
