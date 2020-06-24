classdef OnePortNLRes < OnePortRes

%     Interface for nonlinear oneport resonator
%     member of OnePortRes
%     
%     OSS : with respect to OnePortRes, 
%     in OnePortNLRes a resis ind and var are implemented
%     to recalculate the ABCD matrices to take into account 
%     nonlinear terms in the var
%     ------ PROPERTIES ------
%
%     Access Protected:
%     resis (OptResistor)
%     ind   (OptInd)
%     
%     Set-Access Protected:
%     var (OptNLCap)
%     
%     ------ METHODS ------
%     
%     Public:
%     OnePortNLRes(varargin)       -> pass all options of
%                                     OptNLCap and OnePortRes
%                                     OSS:
%                                     resis, ind and var.capacitance 
%                                     are non optimizable by default
%     get_opt_param()           ->  returns optimizable opt_param
%     set_def_bounds()          -> set default boundaries
    
    properties (Access=protected)
        
        resis OptResistor = OptResistor('value',1,'dummyResistor');
        
        ind OptInd = OptInd('value',1e-9,'label','dummyInductor');
     
    end
    
    properties (SetAccess=protected)
        
        var OptNLCap = OptNLCap('value',1e-12);

    end
    
    methods
       
        function obj=OnePortNLRes(varargin)
            
            obj=obj@OnePortRes(varargin{:});
            
            obj.var=OptNLCap(varargin{:});
            
            obj.resis.optimizable=false;
            
            obj.ind.optimizable=false;  
            
            obj.var.capacitance.optimizable=false;
            
        end
        
        function opt_par=get_opt_param(obj)
        
            opt_par=get_opt_param@OnePortRes(obj);
            
            if obj.var.mod_freq.optimizable
                
                opt_par=[opt_par obj.var.mod_freq];
                
            end
            
            if obj.var.mod_depth.optimizable
                
                opt_par=[opt_par obj.var.mod_depth];
                
            end
            
            if obj.var.mod_phase.optimizable
                
                opt_par=[opt_par obj.var.mod_depth];
                
            end
        
        end
        
        function set_def_bounds(obj)
            
            obj.set_def_bounds@OnePortRes;
            obj.var.set_def_bounds;
        end
        
    end
       
end
