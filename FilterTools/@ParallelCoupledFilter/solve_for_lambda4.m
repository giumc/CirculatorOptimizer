function solve_for_lambda4(obj)

    % ParallelCoupledFilter implementation

    cpl=obj.get_coupledlines;
    
    omega_c=obj.get_omega_c;
    
    for i=1:length(cpl)
        
        obj.coupledlines(i).solve_for_lambda4(omega_c/2/pi);
        
    end

end
