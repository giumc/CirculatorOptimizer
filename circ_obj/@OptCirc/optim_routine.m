function optim_routine(obj)
    
%     startmsg = fprintf("Start optimization\n");
    
    loop = true;
    
    iter = 0;
    
    while loop

        
        x0=obj.get_opt_norm_values;

        if(iter>0)

%             fprintf(repmat('\b',1,itermsg));

            drawnow;

        end

        iter=iter+1;

%         itermsg=fprintf("Iteration n %d",iter);

        obj.run_optim();

        %get final array of optimizands value

        xnew  = obj.get_opt_norm_values;

        if any( abs (xnew-x0) > 0.1 )
            
            obj.update_bounds;
            
            fprintf("\n----END CYCLE %d -----\n",iter);
            
        else
            
            loop=false;
            
        end

    end
    
%     if obj.error_function>=1e-2
%         
%         obj.fine_optim;
%         
%     end
    

end
