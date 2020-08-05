function update_filt(obj)


    res=obj.resonators;

    n=obj.order;
    
    f_c=obj.f_c;
    
    kt2=obj.kt2;
    
    zref=obj.ref_impedance;

    q_u=obj.q_u;
    
    if (isempty(res)||isempty(n)||isempty(f_c)||isempty(kt2)||...
            isempty(zref)||isempty(q_u))
        
        return % not yet properly initialized
        
    end
    
    switch obj.lastres

        case 'shunt_res'

            for i=1:length(res)

                switch mod(n-i,2)

                    case 0 % shunt
                        
                        res(i).kt2.set_value(kt2,'override');
                        
                        res(i).f_center.set_value(f_c,'override');

                        res(i).z_match.set_value(...
                            zref*obj.ratio_cap,'override');
                        
                        res(i).q_unloaded.set_value(q_u,'override');

                    case 1 % series
                        
                        res(i).kt2.set_value(kt2,'override');

                        res(i).f_center.set_value(obj.f_antires(res(i)),'override');
                        
                        res(i).z_match.set_value(...
                            zref/obj.ratio_cap,'override');
                        
                        res(i).q_unloaded.set_value(q_u,'override');

                end

            end

        case 'series_res'

            for i=1:length(res)
                
                switch mod(n-i,2)

                    case 1 % shunt

                            res(i).kt2.set_value(kt2,'override');

                            res(i).f_center.set_value(f_c,'override');

                            res(i).z_match.set_value(...
                                zref*obj.ratio_cap,'override');
                            
                            res(i).q_unloaded.set_value(q_u,'override');

                    case 0% series

                        res(i).kt2.set_value(kt2,'override');

                        res(i).f_center.set_value(obj.f_antires(res(i)),'override');

                        res(i).z_match.set_value(...
                            zref/obj.ratio_cap,'override');
                        
                        res(i).q_unloaded.set_value(q_u,'override');
                        
                end

            end

    end

end
