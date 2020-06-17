function m = seriesABCD (obj, freq)

    % function m = seriesABCD (obj, freqs)
    % varactor ACBD matrix
    
    nfreq=length(freq);

    ypar=(1i.*2*pi*freq*obj.capacitance.value);

    A=diag(ones(nfreq,1));
    
    B=(2+obj.mod_depth.value^2).*diag(1./(2*ypar));
    
    C=diag(zeros(nfreq,1));
    
    D=diag(ones(nfreq,1));

    phase=obj.mod_phase.value*pi/180;

    phasecomp=@(x) exp(1i*phase*x);

    alpha=obj.mod_depth.value;

    %first order terms

    if nfreq>1

        for k=1:(nfreq-1)

            B(k,k+1)=-phasecomp(-1)*alpha*(4+3*alpha^2)/8/ypar(k+1);

            B(k+1,k)=-phasecomp(1)*alpha*(4+3*alpha^2)/8/ypar(k);

        end

    end

    %second order terms

    if nfreq>2

        for k=1:(nfreq-2)

            B(k,k+2)=phasecomp(-2)*alpha^2/4/ypar(k+2);

            B(k+2,k)=phasecomp(2)*alpha^2/4/ypar(k);

        end

    end

    %third order terms
    if nfreq>3

        for k=1:(nfreq-3)

            B(k,k+3)=-phasecomp(-3)*alpha^3/8/ypar(k+3);

            B(k+3,k)=-phasecomp(3)*alpha^3/8/ypar(k);

        end

    end

    m = [ A B ; C D];
    
end
