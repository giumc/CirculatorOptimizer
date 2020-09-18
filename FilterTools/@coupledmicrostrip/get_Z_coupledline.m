function Z=get_Z_coupledline(obj)

%CoupledMicrostrip implementation

    Z_e=obj.get_Z_even;
    
    Z_o=obj.get_Z_odd;
    
    Z=sqrt(Z_e*Z_o);

end
