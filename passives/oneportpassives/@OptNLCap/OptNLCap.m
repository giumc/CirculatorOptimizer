classdef OptNLCap < OnePortPassive
    
    %     
%         Private,Constant:
%         def_max_mod_freq=0.3;
%         def_max_mod_depth=0.3;
%         def_mod_freq=0.1;
%         def_mod_depth=0.1;
%         def_mod_phase=0;
%         def_max_mod_phase=360;

    properties (Access=private,Constant)
        
        def_cap=1e-12;
        def_mod_freq=0.1;
        def_mod_depth=0.1;
        def_mod_phase=0;
        def_max_mod_freq=0.3;
        def_max_mod_depth=0.3;
        def_max_mod_phase=360;
        def_min_mod_freq=0;
        def_min_mod_depth=0;
        
    end
    
    properties (SetAccess=private)
        
        mod_freq  OptParam = OptParam('value',OptNLCap.def_mod_freq,'label','mod_ratio');
        mod_depth OptParam = OptParam('value',OptNLCap.def_mod_depth,'label','mod_depth');
        mod_phase OptParam = OptParam('value',OptNLCap.def_mod_phase,'label','mod_phase');
        capacitance OptCap = OptCap('value',OptNLCap.def_cap);
        
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
        
        function set_bounds(obj)
        
            obj.mod_freq.rescale_bounds;
            obj.mod_depth.rescale_bounds;
            obj.mod_phase.rescale_bounds;
            obj.capacitance.rescale_bounds;
            
            %override min mod freq /depth
            obj.mod_freq.set_min(obj.def_min_mod_freq);
            obj.mod_depth.set_min(obj.def_min_mod_depth);
            obj.mod_freq.set_max(obj.def_max_mod_freq);
            obj.mod_depth.set_max(obj.def_max_mod_depth);
            
        end
        
        function opt_par=get_OptParam(obj)
            
            opt_par=[];
            
            if obj.capacitance.optimizable
            
                opt_par=[opt_par, obj.capacitance];
                
            end
            
            if obj.mod_freq.optimizable
                
                opt_par=[opt_par obj.var.mod_freq];
                
            end
            
            if obj.var.mod_depth.optimizable
                
                opt_par=[opt_par obj.var.mod_depth];
                
            end
            
            if obj.var.mod_phase.optimizable
                
                opt_par=[opt_par obj.var.mod_depth];
                
            end
            
        end
        
    end

end
