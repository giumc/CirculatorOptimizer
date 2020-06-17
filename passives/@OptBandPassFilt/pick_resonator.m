function res=pick_resonator(n,f,q)

    %res=pick_resonator(n,f,q)
    %picks resonators (members of OnePortRes)
    %initialized with default values of
    %center frequency f and loaded q 
    
    if mod(n,2)==1
        res=OptParalRes('f_center',f,'q_loaded',q);
    else
        if mod(n,2)==0
            res=OptSeriesRes('f_center',f,'q_loaded',q);
        else
            error("Resonator Init Failed in OptBandPassFilt");
        end
    end
    
end
