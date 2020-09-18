function init_filt(obj,varargin)

    %implementation for interface OptLadderFilt
    if ~isempty(varargin)
        
        for i=1:length(varargin)
            
            if isstring(varargin{i})||ischar(varargin{i})
                
                switch varargin{i}
            
                    case 'order'

                        if ~isempty(varargin{i+1})

                            obj.order=varargin{i+1};

                        end
                        
                    case 'lastres'
                        
                        if ~isempty(varargin{i+1})
                            
                            obj.lastres=varargin{i+1};
                            
                        end
                        
                    case 'ref_impedance'
                        
                        if ~isempty(varargin{i+1})
                            
                            obj.set_ref_impedance(varargin{i+1});
                            
                        end
                        
                end

            end

        end

    end
    
    if isempty(obj.order)
        
        obj.order=OptLadderFilt.def_order;
        
    end
    
    if isempty(obj.ref_impedance)
        
        obj.set_ref_impedance(OptLadderFilt.def_r_term);
        
    end

    for i=1:obj.order

        obj.resonators(i)=obj.pick_resonator(i);

    end

    obj.set_ref_impedance(obj.ref_impedance);
    
end
   
