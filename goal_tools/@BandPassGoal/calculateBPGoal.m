function goal=calculateBPGoal(obj)

    w=obj.f_array;
    
    wc=obj.f_center;
    
    Outofband=obj.outofbandgoal;
    
    ILvalue=obj.inbandgoal;
    
    skirt=2*(obj.f_array(end)-obj.f_center);
    
    IL_frac_BW=obj.bandwidth;
    
    goal=zeros(1,length(w));
    
    warning("Function 'calculateBPGoal' to be implemented");
    
end
