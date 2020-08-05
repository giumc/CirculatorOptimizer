function res=pick_resonator(obj,n)

    %implementation for OptBandPassFilt
    
    order=obj.order;
    
    if strcmp(obj.lastres,'shunt_res')

        if mod(order-n,2)==0
            
            res=OptParalRes();
            
            res.label=strcat(res.label,' ',num2str(n))
            
        else
            
            if mod(order-n,2)==1
                
                res=OptSeriesRes();
                
                res.label=strcat(res.label,' ',num2str(n))
                
            else
                
                error("Resonator Init Failed in OptBandPassFilt");
                
            end
            
        end
        
    else
        
        if strcmp(obj.lastres,'series_res')
            
            if mod(order-n,2)==0
            
                res=OptSeriesRes();

                res.label=strcat(res.label,' ',num2str(n))
            
            else

                if mod(order-n,2)==1

                    res=OptParallelRes();

                    res.label=strcat(res.label,' ',num2str(n))

                else

                    error("Resonator Init Failed in OptBandPassFilt");

                end

            end
            
        end
            
    end 
    
end
