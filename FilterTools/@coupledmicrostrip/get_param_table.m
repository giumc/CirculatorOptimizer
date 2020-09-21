function tab=get_param_table(obj)

    tab=obj.get_param_table@Microstrip;
    
    spacing=obj.get_spacing('mil');
    
    tab2=table(spacing);
    
    tab2.Properties.VariableNames=["spacing"];
    tab2.Properties.VariableUnits=["mils"];
    
    tab=horzcat(tab2,tab);
    
    tab.Properties.RowNames=["CoupledMicrostrip"];
end
