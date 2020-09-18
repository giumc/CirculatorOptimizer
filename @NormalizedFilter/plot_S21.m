function plot_S21(obj,varargin)

    omega=obj.omega_axis;
    
    domega=obj.domega_axis;
    
    freq=omega/2/pi;
    
    tf=obj.get_S21(freq);
    
    f=figure;
    
    ax=axes(f);
    
    p=plot(omega,20*log10(abs(tf)));
    
    p.DisplayName='Magnitude';
    
    xlabel('\Omega [rad/s]');
    
    ylabel('[dB]');
    
%     keyboard();
    
    p.Color=rgb("Firebrick");
    
    ax.YAxis(1).Color=rgb("Firebrick");
    
    xlim([min(omega) max(omega)]);
    
    yyaxis right
    
    q=plot(omega,medfilt1(-gradient(angle(tf),domega),5));
    
    q.DisplayName='GroupDelay';
    
    q.Color=rgb("RoyalBlue");
   
    ylabel ('[sec]');
    
    ax.YAxis(1).Color=rgb("Firebrick");
    
    ax.YAxis(2).Color=rgb("RoyalBlue");
    
%     ax.YGrid='off';
    
    xlims=ax.YAxis(1).Limits;
    
    ax.YAxis(1).TickValues=linspace(xlims(1),xlims(2),11);
    
    l=legend(ax);
    
    l.Location='southwest';
    
    ax.GridColor=rgb("Grey");
    
    ax.GridLineStyle='-.';
    
    ax.GridAlpha=0.3;
    
    if ~ check_if_string_is_present(varargin,'h')

        input("Press to close")

        close all
        
    end
    
    
end
