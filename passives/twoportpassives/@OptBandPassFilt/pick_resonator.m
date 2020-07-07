function res=pick_resonator(obj,n)

    %res=pick_resonator(n,f,q)
    %picks resonators (members of OnePortRes)
    order=obj.order;
    if mod(order-n,2)==0
        res=OptParalRes();
        res.label=num2str(n);
    else
        if mod(order-n,2)==1
            res=OptSeriesRes();
            res.label=num2str(n);
        else
            error("Resonator Init Failed in OptBandPassFilt");
        end
    end
    
end
