function g=get_normalized_params(obj)

    fc=obj.f_center;
    
    fbw=obj.bandwidth;
    
    g=[];
    
    if ~isempty(obj.passive)
        
        g=obj.passive.get_normalized_params(fc,fbw);
        
    end
    
    g=[ g obj.nlres.get_normalized_param(fc,fbw) obj.load.value];
        
end
   
