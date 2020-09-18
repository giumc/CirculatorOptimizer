function path=get_save_folder(obj)

    save_folder=strrep(mfilename('fullpath'),...
           strcat('CircOptimizer',filesep,...
           'plot_tools',filesep,...
           '@OptPlot',filesep,'get_save_folder'),...
           strcat('Results',filesep));
       
    foldername=strcat(obj.opt_obj.label,' order ',num2str(obj.opt_obj.order));
    
    if ~ makefolder(save_folder,foldername)
        
        error("Could not setup folder\n");
        
    end
    
    path=strcat(save_folder,foldername,filesep,foldername);

end
