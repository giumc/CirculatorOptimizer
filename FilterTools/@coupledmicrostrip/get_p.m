function p=get_p(obj,f)

    u=obj.get_width('mil')/obj.get_thickness('mil');
    
    g=obj.get_spacing('mil')/obj.get_thickness('mil');
    
    eps_r=obj.get_epsilon_r;
    
    f=obj.get_norm_freq(f);
    
    %warnings
    
    warningerr="Warning,possible inaccurate results";
    
    if u<0.1 ||u>10
        
        fprintf(warningerr);
        
    end
    
    if g<0.1 ||g>10
        
        fprintf(warningerr);
        
    end
    
    if eps_r<=1 ||eps_r>18
        
        fprintf(warningerr);
        
    end
    
    p(1)=0.27488+u*...
        (0.6315+0.525/(1+0.015*f)^20)-...
        0.065683*exp(-8.7513*u);
    
    p(2)=0.33622*(1-exp(-0.03442*eps_r));
    
    p(3)=0.0363*exp(-4.6*u)*(1-exp((-f/38.7)^4.97));
    
    p(4)=1+2.751*...
        (1-exp(-(eps_r/15.916)^8));
    
    p(5)=0.334*exp(-3.3*(eps_r/15)^3)+0.746;
    
    p(6)=p(5)*eps(-(f/18)^0.368);
    
    p(7)=1+4.069*p(6)*g^0.479*exp(-1.347*g^0.595-0.17*g^2.5);
    
    p(8)=0.7168*(1+1.076/(1+0.0576*(eps_r-1)));
    
    p(9)=p(8)-0.7913*(1-exp(-(f/20)^1.424))*...
        atan(2.481*(eps_r/8)^0.946);
    
    p(10)=0.242*(eps_r-1)^0.55;
    
    p(11)=0.6466*(exp(-0.3401*f)-1)*atan(1.263*(u/3)^1.629);
    
    p(12)=p(9)+(1-p(9))/(1+1.183*exp(1.376));
    
    p(13)=1.695*p(10)/(0.414+1.605*p(10));
    
    p(14)=0.8928+0.1072*(1-exp(-0.42*(f/20)^3.215));
    
    p(15)=abs(1-0.8928*(1+p(11))*p(12)*exp(-p(13)*g^1.092)/p(14));
    
end
