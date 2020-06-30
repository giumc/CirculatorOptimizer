function foundflag=find_plot(obj)

    x=findobj;
        
    foundflag=0;

        for i=1:length(x)

            if isa(x(i),'matlab.ui.Figure')

                if isvalid(x(i)) && strcmp(x(i).Name,obj.label)

                    obj.fig=x(i);
                    obj.fig.Visible='on';
                    foundflag=1;
                    break

                end

            end

        end

end
