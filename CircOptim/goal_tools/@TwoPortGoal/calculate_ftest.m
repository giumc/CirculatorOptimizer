 function calculate_ftest(obj)
 
        f_min = max(...
            0,...
            obj.f_center*(1-obj.bandwidth));
            
        f_max = obj.f_center*(1+obj.bandwidth);
            
        obj.f_test=linspace(f_min,f_max,obj.fpoints);
      
 end
