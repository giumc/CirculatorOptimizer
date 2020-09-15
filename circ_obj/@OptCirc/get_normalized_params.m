function g=get_normalized_params(obj)

    fc=obj.f_center;
    
    g=[];
    
    if ~isempty(obj.passive)
        
        g=obj.passive.get_normalized_params(fc);
        
    end
    
    g=[ g obj.nlres.get_normalized_param(fc)];
        
end
   
