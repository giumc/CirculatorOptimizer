function save_result(obj)

   %by default, it saves png and .m file
   %in CircOptimizer/Results folder
   %
   %pass as many options as you need:
   %'png' to print png
   %'vec' to print eps and emf file
   %'fig' to print fig file
   %'tab' to print table
   %'full' to print png,eps,fig,csv and mat file with circ data
   %'data' to save only .m data file
   % OSS:
   
   save_folder=mfilename;
   
   outcome=false;
    if isempty(obj.data_table)
        obj.data_table=gen_table(r);
    end
    
    if ~isempty(obj.save_folder)
        if isfolder(obj.save_folder)
            savepathfile=obj.save_folder;        
        else
            addpath(obj.save_folder)
            if isfolder(obj.save_folder)
                savepathfile=obj.save_folder;        
            else
                fprintf("Cannot get to %s \n,abort",obj.save_folder);
                return
            end
        end
    else
        if obj.makefolder(obj.touchstone_folder,'Fit Result')
            obj.save_folder=strcat(obj.touchstone_folder,'Fit Result',filesep);
            savepathfile=obj.save_folder;
        else
            fprintf("No save folder for %s, abort\n",obj.tag);
            return
        end
    end
         
    filename=regexprep(obj.tag,'.[sS][12][pP]','');
    
    filepath=strcat(savepathfile,filename);
    
    tablename=strcat(filepath,'.csv');
    
    resobj=r;
    
    printflag=fprintf("Saving %s resonator data",filename);
    guioptions={};
    %look for guioptions first
    if ~isempty(varargin)
        for i=1:length(varargin)
            if strcmp(varargin{i},'guioptions')
                if ~isempty(varargin{i+1})
                    guioptions={varargin{i+1:end}};
                    break
                end
            end
        end
    end
        
    if ~isempty(varargin)
        for i=1:length(varargin)
            switch varargin{i}
                case 'png'
                    obj.setup_gui(guioptions{:});
                    print(obj.figure,filepath,'-dpng','-r100');
                    obj.delete_gui;
                    outcome=true;
                case 'vec'
                    obj.setup_gui(guioptions{:});
                    print(obj.figure,filepath,'-depsc','-r0','-painters');
                    print(obj.figure,filepath,'-dmeta','-r0','-painters');
                    obj.delete_gui;
                    outcome=true;
                case 'fig'
                    obj.setup_gui(guioptions{:});
                    savefig(obj.figure,filepath);
                    obj.delete_gui;
                    outcome=true;
                case 'data'
                    save(strcat(filepath,'.mat'),'resobj');
                    outcome=true;
                case 'full'
                    obj.setup_gui(guioptions{:});
                    savefig(obj.figure,filepath);
                    print(obj.figure,filepath,'-depsc','-r0','-painters');
                    obj.delete_gui;
                    writetable(obj.data_table,tablename,'WriteRowNames',true);%,'FileType','.csv');
                    save(strcat(filepath,'.mat'),'resobj');
                    outcome=true;
                    break
            end
        end
    else
        obj.setup_gui('minimal','Visible','off');
        print(obj.figure,filepath,'-dpng','-r100');
        obj.delete_gui;
        writetable(obj.data_table,tablename,'WriteRowNames',true);%,'FileType','.csv');
        save(strcat(filepath,'.mat'),'resobj');
        outcome=true;
    end
        
    
    
    fprintf(repmat('\b',1,printflag))

end
