function varargout=summary(obj)
    
   s=strcat('\n\n',obj.label,'\n\n');
   
   s=strcat(s,obj.summary_parameter('F_center',obj.f_center));
   
   s=strcat(s,obj.summary_parameter('bandwidth',obj.bandwidth));
   
   s=strcat(s,obj.summary_parameter('Fpoints',obj.fpoints));
   
   s=strcat(s,obj.summary_parameter('Direction',obj.direction));
   
   s=strcat(s,obj.summary_parameter('Harmonics',obj.harmonics));
   
   s=strcat(s,obj.summary@OptNLBranch);
   
   switch nargout
       
       case 0 
           
           fprintf(s);
           
       case 1
           
           varargout{1}=s;
           
   end

end
