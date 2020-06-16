function res=pick_resonator(n,f,q)

    if mod(n,2)==1
        res=OptSeriesRes('f_center',f,'q_loaded',q);
    else
        if mod(n,2)==0
            res=OptParalRes('f_center',f,'q_loaded',q);
        else
            error("Resonator Init Failed in OptBandPassFilt");
        end
    end
    
end
