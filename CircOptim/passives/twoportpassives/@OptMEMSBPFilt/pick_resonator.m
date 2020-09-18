function res=pick_resonator(obj,n)

    %implementation for OptMEMSBPFilt
    
    order=obj.order;
    
    switch obj.lastres

        case 'shunt_res'
            
            if mod(order-n,2)==0

                res=OnePortPiezoRes('f_center',obj.def_f_c);
                
                res.label=strcat(res.label,' ',num2str(n));

            else

                if mod(order-n,2)==1

                    res=OnePortPiezoRes(...
                        'f_center',...
                        obj.f_antires(obj.def_f_c,obj.def_kt2));
                    
                    res.label=strcat(res.label,' ',num2str(n));

                else

                    error("Resonator Init Failed in OptBandPassFilt");

                end

            end
            
        case 'series_res'

            if mod(order-n,2)==0

                res=OnePortPiezoRes(...
                        'f_center',...
                        obj.f_antires(obj.def_f_c,obj.def_kt2));
                
                res.label=strcat(res.label,' ',num2str(n));

            else

                if mod(order-n,2)==1

                    res=OnePortPiezoRes('f_center',obj.def_f_c);
                    
                    res.label=strcat(res.label,' ',num2str(n));

                else

                    error("Resonator Init Failed in OptBandPassFilt");

                end
                
            end
            
    end
      
end
