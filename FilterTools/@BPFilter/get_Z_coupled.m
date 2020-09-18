function tab=get_Z_coupled(obj)

    Yinv=obj.get_inverter_Y;
    
    z_term=obj.get_z_term;
    
    for i=1:length(Yinv)
        
        Z_e(i)=z_term*(1+Yinv(i)*z_term+(Yinv(i)*z_term)^2);
        
        Z_o(i)=z_term*(1-Yinv(i)*z_term+(Yinv(i)*z_term)^2);
        
    end
    
    varnames=string(strcat('ord',num2str((1:4).')));
    
    t1=array2table(Z_e,'VariableNames',varnames);
    t2=array2table(Z_o,'VariableNames',varnames);
    
    tab=vertcat(t1,t2);
    tab.Properties.RowNames={'Z_even','Z_odd'};

end
