function d=generate_plot_data(obj)
    
    % MEMSres version
    
    simlineoption=obj.simlineoption;
    
    f_test=obj.f_test;
    
    y_f=obj.calculate_y_f;
    
    [f_test,label]=num2str_sci(f_test);
    
    ymag_min        =   floor((min(db(abs(y_f))-10)/10))*10;
    ymag_max        =   ceil((max(db(abs(y_f))+10)/10))*10;
    
    xaxisname=strcat("Frequency, ",label,"[Hz]");
    
    legendlabels=["SIM"];
    
    varnames={'X1','Y1'};
    d(1).data=table(f_test,db(abs(y_f).'));
    
    d(1).data.Properties.VariableNames=varnames;
    d(1).XAxisLabel=xaxisname;
    d(1).YAxisLabel=strcat("|Y(f)| [dB]");
    d(1).LegendLabel=legendlabels;
    d(1).YAxisLim=[ymag_min ymag_max];
    
    d(2).data=table(f_test,(angle(y_f)*180/pi).');
    d(2).data.Properties.VariableNames=varnames;
    d(2).XAxisLabel=xaxisname;
    d(2).YAxisLabel=strcat("Y(f) \circ");
    d(2).LegendLabel=legendlabels;
    d(2).YAxisLim=[-100 100];
    
    for i=1:length(d)
        
        d(i).LineOption={simlineoption};
        
    end
    
end
