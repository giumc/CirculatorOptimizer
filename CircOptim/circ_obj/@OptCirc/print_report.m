function varargout=print_report(obj)

    clc

    optparam=obj.get_OptParam;
    report=["","------ Circulator Parameters -----",""];
    labels=pad([optparam.label]);
    values=[optparam.value];
    
    for i=1:length(optparam)
       
        report=[report,...
            sprintf('%s \t = %8.3f',labels(i),values(i))];
        
    end
    
    report=[report,"","----------------------------------",""];
    
    if nargout==0
        
        disp(char(report(:)))
        
    else
        
        varargout{1}=report;
        
    end

end
