classdef OptNLCap < OnePortPassive
    
    properties (SetAccess=private)
        
        mod_freq  opt_param = opt_param('value',0.1,'label','mod_ratio');
        mod_depth opt_param = opt_param('value',0.1,'label','mod_depth');
        mod_phase opt_param = opt_param('value',0,'label','mod_phase');
        capacitance OptCap = OptCap('value',1e-12);
        
    end
    
    methods
       
        function obj=OptNLCap(varargin)
        
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

                            case {'capacitor','cap'}
                                
                                obj.capacitance.set_value(varargin{i+1},'override');

                        end

                    end
                    
                end

            end
            
        end
        
        function imp = z(obj,freq)
            [ ~, b, ~, d] = ABCD_split(obj.seriesABCD(freq)) ;
            imp = b/d;
        end
        
        function adm = y(obj,freq)
            imp = obj.z(freq);
            adm = inv(imp);
        end
        
        m = seriesABCD(obj,freq);
        
        function m = shuntABCD(obj,freq)
            
            a = diag(ones(1,length(freq)));
            b = diag(zeros(1,length(freq)));
            c = obj.y(freq);
            d = a;
            
            m = [a b ; c d];
        
        end

    end

end
