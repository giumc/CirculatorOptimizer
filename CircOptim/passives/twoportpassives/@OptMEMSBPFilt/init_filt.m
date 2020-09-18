function init_filt(obj,varargin)

    %implementation for MEMSBPFIlt
    
    obj.init_filt@OptLadderFilt(varargin{:});
    
    if ~isempty(varargin)
        
        for i=1:length(varargin)
            
            if isstring(varargin{i})||ischar(varargin{i})
                
                switch varargin{i}
            
                    case {'f_c';'f_center';'f_res'}

                        if ~isempty(varargin{i+1})

                            obj.set_f_c(varargin{i+1});

                        end
                        
                    case 'kt2'
                        
                        if ~isempty(varargin{i+1})
                            
                            obj.set_kt2(varargin{i+1});
                            
                        end
                        
                    case {'ratiocap';'ratio_cap'}
                        
                        if ~isempty(varargin{i+1})
                            
                            obj.set_ratio_cap(varargin{i+1});
                            
                        end
                        
                    case 'q_u'
                        
                        if ~isempty(varargin{i+1})
                            
                            obj.set_q_u(varargin{i+1});
                            
                        end
                        
                        
                end

            end

        end

    end
    
    if isempty(obj.f_c)
        
        obj.set_f_c(OptMEMSBPFilt.def_f_c);
        
    end
    
    if isempty(obj.kt2)
        
        obj.set_kt2(OptMEMSBPFilt.def_kt2);
        
    end
    
    if isempty(obj.ratio_cap)
        
        obj.set_ratio_cap(OptMEMSBPFilt.def_ratio_cap);
        
    end
    
    if isempty(obj.q_u)
        
        obj.set_q_u(OptMEMSBPFilt.def_q_u);
        
    end
    
    
end
   
