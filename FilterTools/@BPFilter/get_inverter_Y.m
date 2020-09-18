function y=get_inverter_Y(obj)

    g=[1 obj.get_coeffs];
    
    fbw=obj.get_fractional_bw;
    
    z_term=obj.get_z_term;
    
    for i=1:(length(g)-1)
       
        if i==1 ||i==(length(g)-1)
            
            y(i)=sqrt(pi/2*fbw/g(i)/g(i+1))/z_term;
            
        else
            
            y(i)=pi/2*fbw/sqrt(g(i)*g(i+1))/z_term;
            
        end
        
    end

end
