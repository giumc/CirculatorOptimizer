function init_cap(obj,varargin)

    if ~isempty(varargin)

            for i=1:length(varargin)

                if (ischar(varargin{i})||isstring(varargin{i}))

                    switch varargin{i}

                        case 'mod_freq'

                            obj.mod_freq.set_value(varargin{i+1},'override');

                        case 'mod_depth'

                            obj.mod_depth.set_value(varargin{i+1},'override');

                        case 'mod_phase'

                            obj.mod_phase.set_value(varargin{i+1},'override');

                        case {'capacitor','cap','capacitance'}

                            obj.capacitance.set_value(varargin{i+1},'override');

                    end

                end

            end

    end

end
