function set_components(obj)

%LPFilter implementation

    ind_transform=1/obj.get_omega_c*obj.z_term;
    
    cap_transform=1/obj.get_omega_c/obj.z_term;
    
    obj.set_components@NormalizedFilter(); 
    
    elems=obj.get_components;
    
    for i=1:length(elems)
        
        switch class(elems(i))
            
            case 'OptResistor'
            
                elems(i).set_value(elems(i).value*obj.get_z_term,'override');
                
            case 'OptCap'
                
                elems(i).set_value(elems(i).value*cap_transform,'override');
                
            case 'OptInd'
                
                elems(i).set_value(elems(i).value*ind_transform,'override');
                
        end
        
    end

end
