classdef OptNLCap < OnePortPassive
    
    %     
%         Private,Constant:
%         def_max_mod_freq=0.3;
%         def_max_mod_depth=0.3;
%         def_mod_freq=0.1;
%         def_mod_depth=0.1;
%         def_mod_phase=0;
%         def_max_mod_phase=360;

    properties (SetAccess=private)
        
        mod_freq  opt_param = opt_param('value',OptNLCap.def_mod_freq,'label','mod_ratio');
        mod_depth opt_param = opt_param('value',OptNLCap.def_mod_depth,'label','mod_depth');
        mod_phase opt_param = opt_param('value',OptNLCap.def_mod_phase,'label','mod_phase');
        capacitance OptCap = OptCap('value',OptNLCap.def_cap);
        
    end
    
    properties (Access=private,Constant)
        
        def_cap=1e-12;
        def_mod_freq=0.1;
        def_mod_depth=0.1;
        def_mod_phase=0;
        def_max_mod_freq=0.3;
        def_max_mod_depth=0.3;
        def_max_mod_phase=360;
        
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
        
        function set_def_bounds(obj)
        
            obj.set_opt_param_min(obj.mod_freq,0);
            obj.set_opt_param_min(obj.mod_depth,0);
            obj.set_opt_param_min(obj.mod_phase,0);
            obj.set_opt_param_max(obj.mod_freq,obj.def_max_mod_freq);
            obj.set_opt_param_max(obj.mod_depth,obj.def_max_mod_depth);
            obj.set_opt_param_max(obj.mod_phase,obj.def_max_mod_phase);
            
            obj.set_opt_param_min(obj.capacitance,obj.def_cap*0.5);
            obj.set_opt_param_max(obj.capacitance,obj.def_cap*1.5);
        end
        
    end

end
