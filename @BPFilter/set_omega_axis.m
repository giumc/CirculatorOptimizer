function set_omega_axis(obj)

    fbw=obj.get_fractional_bw;
    
    omega_c=obj.get_omega_c;

    omega_min=max([0 omega_c*(1-2.5*fbw)]);
    
    omega_max=omega_c*(1+2.5*fbw);
    
    obj.domega_axis=(fbw*omega_c/50);
    
    obj.omega_axis=omega_min:obj.domega_axis:omega_max;
    
end

