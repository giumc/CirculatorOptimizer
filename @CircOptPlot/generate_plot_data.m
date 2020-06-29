function d=generate_plot_data(obj)
    
    
    simlineoption=obj.simlineoption;
    goallineoption=obj.goallineoption;
    circ=obj.opt_obj;
    
    s_f=circ.calculate_S_lin_response;
    
    s11= squeeze(s_f(1,1,:));
    s21= squeeze(s_f(2,1,:));
    s12= squeeze(s_f(1,2,:));
    s22= squeeze(s_f(1,1,:));
    
    [~,label]=num2str_sci(circ.f_test);
    
    xaxisname=strcat("Frequency, ",label,"[Hz]");
    
    legendlabels=["SIM","GOAL"];
    
    varnames={'X1','Y1','X2','Y2'};
    d(1).data=table(circ.f_test,abs(s11).',...
        circ.RLgoal.f_array,circ.RLgoal.goal);
    
    d(1).data.Properties.VariableNames=varnames;
    d(1).XAxisLabel=xaxisname;
    d(1).YAxisLabel=strcat("|S_{11}|");
    d(1).LegendLabel=legendlabels;
    d(1).YAxisLim=[0 1];
    
    d(2).data=table(circ.f_test,abs(s21).',...
        circ.ILgoal.f_array,circ.ILgoal.goal);
    d(2).data.Properties.VariableNames=varnames;
    d(2).XAxisLabel=xaxisname;
    d(2).YAxisLabel=strcat("|S_{21}|");
    d(2).LegendLabel=legendlabels;
    d(2).YAxisLim=[0 1];
    
    d(3).data=table(circ.f_test,abs(s12).',...
        circ.ISOgoal.f_array,circ.ISOgoal.goal);
    d(3).data.Properties.VariableNames=varnames;
    d(3).XAxisLabel=xaxisname;
    d(3).YAxisLabel=strcat("|S_{12}|");
    d(3).LegendLabel=legendlabels;
    d(3).YAxisLim=[0 1];
    
    d(4).data=table(circ.f_test,abs(s22).',...
        circ.RLgoal.f_array,circ.RLgoal.goal);
    d(4).data.Properties.VariableNames=varnames;
    d(4).XAxisLabel=xaxisname;
    d(4).YAxisLabel=strcat("|S_{22}|");
    d(4).LegendLabel=legendlabels;
    d(4).YAxisLim=[0 1];
    
    for i=1:length(d)
        d(i).LineOption={simlineoption,goallineoption};
    end
    
end
