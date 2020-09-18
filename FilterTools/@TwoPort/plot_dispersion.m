function plot_dispersion(obj,freq)
    
    for i=1:length(freq)
       
        gammas(i)=obj.get_prop_const(freq(i));

    end
    
    p=plot(2*pi*freq,gammas);

    xlabel('\omega [rad/s]');
    ylabel('\beta');
    
    axis tight
    input("Press to close");
    
    close all
    
end
