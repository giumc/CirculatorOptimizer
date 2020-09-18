function set_components(obj)

    %BPFilter implementation
    
    omega_c=obj.get_omega_c;
    
    z_term=obj.get_z_term;
    
    fbw=obj.get_fractional_bw;
        
    obj.set_components@NormalizedFilter();
    
    elems=obj.get_components;
    
    for i=1:length(elems)
        
        switch class(elems(i))
            
            case 'OptResistor'
                
                elems(i)=OptResistor(...
                    elems(i).value*obj.get_z_term);
                
                elems(i).optimizable=false;
            case 'OptCap'
                
                elems(i)=OptParalRes(...
                    'f_center',omega_c/2/pi,...
                    'q_loaded',elems(i).value/fbw,...
                    'ref_impedance',z_term);
                    
                elems(i).set_optimizable(false);
                
            case 'OptInd'
                
                elems(i)=OptSeriesRes(...
                    'f_center',omega_c/2/pi,...
                    'q_loaded',elems(i).value/fbw,...
                    'ref_impedance',z_term);
                
                elems(i).set_optimizable(false);
                
        end
        
    end
    
    obj.components=elems;
       
end
