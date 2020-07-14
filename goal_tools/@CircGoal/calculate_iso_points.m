function calculate_iso_points(obj)

    % iso frequencies
    iso_bw=obj.bandwidth;
    
    if obj.order==1

        f_points=obj.f_center;
        
    else

        f_points=linspace(...
            obj.f_center*(1-iso_bw/2),...
            obj.f_center*(1+iso_bw/2),...
            100);
        
%         if isempty(f_points(f_points==obj.f_center))
%            
%             f_points=[f_points,obj.f_center];
%             
%             f_points=sort(f_points);
%             
%         end
        
    end
    
    % iso values
%     if obj.order>1
%         f_points([1,end])=[];
%     end
%     
% %         f_points=linspace(...
% %             min(f_points),...
% %             max(f_points),...
% %             100);
    
    iso_values=zeros(1,length(f_points));
    
    % set to object 
    
    if obj.direction==2
        
        obj.ISOgoal.set_f_array(f_points);

        obj.ISOgoal.set_goal(iso_values);
        
    else
        
        if obj.direction==1

            obj.ILgoal.set_f_array(f_points);

            obj.ILgoal.set_goal(iso_values);
            
        else
            
            error("Invalid direction");
            
        end
        
    end
    
    
    

end
