function init_resonator(obj,varargin)

    obj.f_center=OptParam('value',OnePortRes.def_f_c);

    obj.q_unloaded=OptParam('value',OnePortRes.def_q_u);
    
    obj.kt2=OptParam('value',obj.def_kt2,'global_max',1);

    obj.ref_impedance=OnePortRes.def_r_term;
    
    obj.z_match=OptParam('value',obj.def_r_term);
    
    obj.f_center.rescale_factor=obj.def_f_rescale;
    
    obj.z_match.rescale_factor=obj.def_zmatch_rescale;
    
    if ~isempty(varargin)
        
        for i=1:length(varargin)
            
            if isstring(varargin{i}) || ischar(varargin{i})
                
                switch varargin{i}
                    
                    case 'f_center'
                        
                        obj.f_center.set_value(varargin{i+1},'override');
                        
                    case 'q_unloaded'
                        
                        obj.q_unloaded.set_value(varargin{i+1},'override');    
                        
                    case 'kt2'
                        
                        obj.kt2.set_value(varargin{i+1},'override');    
                        
                    case 'z_match'
                        
                        obj.z_match.set_value(varargin{i+1},'override');    
                        
                end
                
            end
            
        end
        
    end
    
end
