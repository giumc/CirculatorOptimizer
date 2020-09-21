function tab=get_param_table(obj)

    width=obj.get_width('mil');
    
    length=obj.get_length('mil');
    
    epsilon_r=obj.get_epsilon_r;
    
    thickness=obj.get_thickness('mil');
    
    tab=table(width,length,thickness,epsilon_r);
    
    tab.Properties.VariableNames=[...
        "width",...
        "length",...
        "thickness",...
        "epsilon_r"];
    
    tab.Properties.VariableUnits=[repmat("mils",1,3),""];

    tab.Properties.RowNames=["Microstrip"];
end
