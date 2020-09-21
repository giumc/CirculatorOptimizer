function tab_out=get_param_table(obj)
    
    %ParallelCoupledFilter implementation
    
    cpl=obj.get_coupledlines;
    
    tab_out=table();
    
    for i=1:length(cpl)
        
        tab_n=cpl(i).get_param_table;
        
        tab_n.Properties.RowNames=...
            strcat(tab_n.Properties.RowNames,...
                sprintf("%d",i));
        
        tab_out=vertcat(tab_out,tab_n);
        
    end
    
    
%     for i=1:length(tab)-1
%         
%         tab_out=vertcat(tab(i),tab(i+1))
%         
%     end

end
