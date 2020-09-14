function plot_dispersion(obj)

    defaultgraph;
    
    min_dec=8;
    max_dec=12;
    
    frequencies=logspace(min_dec,max_dec,10001);
    
    for i=1:length(frequencies)
       
        gammas(i)=obj.get_prop_const(frequencies(i));

    end
    
    p=semilogx(frequencies,10*log10(abs(gammas)));
    ax.XTick=logspace(min_dec,max_dec,max_dec-min_dec+1);

    xlabel('Frequency [Hz]');
    ylabel('\beta');
    
    axis tight
    input("Press to close");
    
    close all
    
end
