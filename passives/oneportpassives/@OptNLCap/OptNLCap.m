classdef OptNLCap < OnePortPassive
    
%         Private,Constant:
%         def_max_mod_freq=0.3;
%         def_max_mod_depth=0.3;
%         def_mod_freq=0.1;
%         def_mod_depth=0.1;
%         def_mod_phase=0;
%         def_max_mod_phase=360;

    properties (Access=private,Constant)
        
        def_cap=1e-12;
        def_mod_freq=0.2;
        def_mod_depth=0.2;
        def_mod_phase=0;
        def_max_mod_freq=0.5;
        def_max_mod_depth=0.5;
        def_max_mod_phase=360;
        def_min_mod_freq=0;
        def_min_mod_depth=0;
        def_min_mod_phase=-360;
        
    end
    
    properties (SetAccess=private)
        
        mod_freq  OptParam ;
        mod_depth OptParam ;
        mod_phase OptParam ;
        capacitance OptCap ;
        
    end
    
    methods
       
        function obj=OptNLCap(varargin)
        
            obj.mod_freq = OptParam('value',OptNLCap.def_mod_freq,...
                'label','mod_freq',...
                'global_max',obj.def_max_mod_freq);
            obj.mod_depth= OptParam('value',OptNLCap.def_mod_depth,...
                'label','mod_depth',...
                'global_max',obj.def_max_mod_depth);
            obj.mod_phase= OptParam('value',OptNLCap.def_mod_phase,...
                'label','mod_phase',...
                'global_max',obj.def_max_mod_phase,...
                'global_min',obj.def_min_mod_phase);
            
            obj.capacitance= OptCap('value',OptNLCap.def_cap);
            
            obj.init_cap(varargin{:});
            
        end
        
        imp=z(obj,freq);
        
        adm=y(obj,freq);
             
        function opt_par=get_OptParam(obj)
            
            opt_par=[];
            
            if obj.capacitance.optimizable
            
                opt_par=[opt_par, obj.capacitance];
                
            end
            
            if obj.mod_freq.optimizable
                
                opt_par=[opt_par obj.mod_freq];
                
            end
            
            if obj.mod_depth.optimizable
                
                opt_par=[opt_par obj.mod_depth];
                
            end
            
            if obj.mod_phase.optimizable
                
                opt_par=[opt_par obj.mod_phase];
                
            end
            
        end
        
    end
    
    methods (Access=protected)
        
        init_cap(obj,varargin);
        
    end

end
