function tab=generate_data_table(obj)
    
    circ=obj.opt_obj;
    
    params=circ.get_OptParam;
    
    for i=1:length(params)
        
        vars(i)=params(i).denormalize;
        names(i)=params(i).label;
    end
    
    tab=array2table(vars);
    tab.Properties.VariableNames=names;
    tab.Properties.RowNames=string(circ.label);
    tab.Properties.DimensionNames={'Circulator','Parameters'};
    
end
