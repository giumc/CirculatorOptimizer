function outcome=save_plot(obj,varargin)

   %by default, it saves png and .m file
   %in Results folder
   %
   %pass as many options as you need:
   %'png' to print png
   %'vec' to print eps and emf file
   %'fig' to print fig file
   %'tab' to print table
   %'full' to print png,eps,fig,csv and mat file with data
   %'data' to save only .m data file
   % OSS:
   
    outcome=false;

    tab=obj.generate_data_table;

    filepath=obj.get_save_folder;
    
    tablename=strcat(filepath,'.csv');

    opt_obj=obj.opt_obj;

    if ~isempty(varargin)
        for i=1:length(varargin)
            switch varargin{i}
                case 'png'
                    print(obj.fig,filepath,'-dpng','-r100');
                    outcome=true;
                    
                case 'vec'
                    print(obj.fig,filepath,'-depsc','-r0','-painters');
                    print(obj.fig,filepath,'-dmeta','-r0','-painters');
                    outcome=true;
                    
                case 'fig'
                    savefig(obj.fig,filepath);
                    outcome=true;
                    
                case 'data'
                    save(strcat(filepath,'.mat'),'opt_obj');
                    outcome=true;
                    
                case 'txt'
                    txtfilename=strcat(filepath,'.out');
                    fid=fopen(txtfilename,'w');
                    fprintf(fid,'%s\n', opt_obj.print_report);
                    fclose(fid);
                    
                case 'full'
                    
                    savefig(obj.fig,filepath);
                    print(obj.fig,filepath,'-depsc','-r0','-painters');
                    writetable(tab,tablename,'WriteRowNames',true);%,'FileType','.csv');
                    save(strcat(filepath,'.mat'),'opt_obj');
                    outcome=true;
                    break
                    
                case 'csv'
                    
                    writetable(tab,tablename,'WriteRowNames',true);%,'FileType','.csv');
                    outcome=true;
                    
                    
            end
            
        end
        
    else
        %default
        savefig(obj.fig,filepath);
        
        writetable(tab,tablename,'WriteRowNames',true);%,'FileType','.csv');
        
        obj.clear_plot;
        delete(obj.fig);
        save(strcat(filepath,'.mat'),'opt_obj');
        
        txtfilename=strcat(filepath,'.out');
        
        fid=fopen(txtfilename,'w');
        fprintf(fid,'%s\n', opt_obj.print_report);
        fclose(fid);  
        
        outcome=true;
        obj.setup_plot;
        obj.update_plot;

    end

end
