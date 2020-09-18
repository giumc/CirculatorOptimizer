function set_omega_axis(obj)

    obj.omega_axis=obj.get_omega_c*(0.01:0.01:3);
    obj.domega_axis=obj.get_omega_c*0.01;

end
