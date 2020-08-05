function init_resonator(obj,varargin)

    obj.f_center=OptParam('value',OnePortRes.def_f_c);

    obj.q_loaded=OptParam('value',OnePortRes.def_q_l);

    obj.q_unloaded=OptParam('value',OnePortRes.def_q_u);

    obj.f_center.rescale_factor=obj.def_f_rescale;

    obj.q_loaded.rescale_factor=obj.def_q_rescale;

     if ~isempty(varargin)

        for i=1:length(varargin)

            if ischar(varargin{i})||isstring(varargin{i})

                switch varargin{i}

                    case {'f','f_center','f_c'}

                        obj.f_center.set_value(varargin{i+1},'override');

                    case {'q','q_ref','q_l','q_loaded'}

                        obj.q_loaded.set_value(varargin{i+1},'override');

                    case {'q_u','qu','q_unloaded'}

                        obj.q_unloaded.set_value(varargin{i+1},'override');
                    
                    case {'label'}
                        
                        obj.label=varargin{i+1};
                
                end

            end

        end

    end % set values as Name Value pair

end
