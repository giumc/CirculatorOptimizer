function plot_dispersion(obj)

    defaultgraph;
    
%     min_dec=6;
%     max_dec=9;
%     
%     frequencies=logspace(min_dec,max_dec,101);
    
    min_f=1e8;
    max_f=1e9;
    frequencies=linspace(min_f,max_f,101);
    
    for i=1:length(frequencies)
       
        gammas(i)=obj.get_prop_const(frequencies(i));
        betas(i)=imag(gammas(i));
        alphas(i)=real(gammas(i));
        
    end
    
%     p=semilogx(frequencies,10*log10(abs(gammas)));
    ax=gca;
%     ax.XTick=logspace(min_dec,max_dec,max_dec-min_dec+1);
    
    p=plot(frequencies/min_f,10*log10(abs(betas)));
    hold on
%     p=semilogx(frequencies,10*log10(abs(alphas)));
    
    xlabel('Frequency [Hz]');
    ylabel('10log_{10}(\beta)');
    
    input("Press to close");
    
    close all
    
end
