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
%     get_OptParam()           ->  returns optimizable OptParam
%     set_bounds()          -> set default boundaries
    
    properties (Access=protected)
        
        resis OptResistor ;
        
        ind OptInd ;
     
    end
    
    properties (Access=protected)
        
        var OptNLCap ;

    end
    
    properties (Dependent)
        
        mod_freq;
        mod_depth;
        mod_phase;
        
    end
    
    methods
       
        function obj=OnePortNLRes(varargin)
            
            obj=obj@OnePortRes(varargin{:});
            
            obj.resis = OptResistor('value',1,'label','dummyResistor');
            
            obj.ind = OptInd('value',1e-9,'label','dummyInductor');
            
            obj.var=OptNLCap(varargin{:});
            
            obj.resis.optimizable=false;
            
            obj.ind.optimizable=false;  
            
            obj.var.capacitance.optimizable=false;
            
        end
        
        function opt_par=get_OptParam(obj)
        
            opt_par=get_OptParam@OnePortRes(obj);
            
            opt_par=[opt_par obj.var.get_OptParam];
        
        end
        
        function set_bounds(obj)
            
            obj.set_bounds@OnePortRes;
            
            obj.var.set_bounds;
            
        end
        
        function v=get.mod_freq(obj)
        
            v=obj.var.mod_freq;
        
        end
        
        function v=get.mod_depth(obj)
        
            v=obj.var.mod_depth;
        
        end
        
        function v=get.mod_phase(obj)
        
            v=obj.var.mod_phase;
        
        end
        
        function set_ref_impedance(obj,value)
            
            set_ref_impedance@OnePortRes(obj,value);
            
            obj.paramchange;
            
        end
        
    end
    
    methods (Access=protected)
        
        function paramchange(obj,varargin)
         
            obj.var.capacitance.set_value(obj.c,'override');
            obj.ind.set_value(obj.l,'override');
            obj.resis.set_value(obj.r,'override');
            
        end
        
    end
       
end
