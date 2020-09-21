function solve_for_Z(obj)

    % ParallelCoupledFilter implementation

    cpl=obj.get_coupledlines;
    
    tab_Z=obj.get_Z_coupled;
    
    tab_Z=rows2vars(tab_Z);
    
    tab_Z.Properties.RowNames=tab_Z.OriginalVariableNames;
    
    tab_Z.OriginalVariableNames=[];
    
    if ~height(tab_Z)==length(cpl)
        
        fprintf("Mismatch in number of lines/required lines\n\n");
        
        return
        
    end
    
    for i=1:length(cpl)
        
        Z_e=tab_Z.Z_even(i);
        
        Z_o=tab_Z.Z_odd(i);
        
        obj.coupledlines(i).solve_for_Z(Z_e,Z_o);
        
    end

end
