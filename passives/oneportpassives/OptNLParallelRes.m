classdef OptNLParallelRes <OnePortNLRes
     
% Implements a parallel nonlinear resonator with nonlinear cap
% member of OnePortNLRes
% 
% OSS: everytime f_c,q_l,q_u are changed, 
%     resis, ind and var param are automatically updated
%     
% ------ METHODS ------
% 
% Public: 
% OptNLSeries(varargin)       -> pass option to OnePortNLRes
    
    methods 
       
        function obj=OptNLParallelRes(varargin)
            
            obj=obj@OnePortNLRes(varargin{:});
            obj.paramchange;
            obj.label ='NLParRes';
            addlistener (obj.f_center,'ValueUpdate',@obj.paramchange);
            addlistener (obj.q_loaded,'ValueUpdate',@obj.paramchange);
            addlistener (obj.q_unloaded,'ValueUpdate',@obj.paramchange);
        
            obj.q_unloaded.optimizable=false;
            obj.var.mod_phase.optimizable=false;
        
        end
        
        function cap = c(obj)
        
            cap=obj.q_loaded.value/(2*pi*obj.f_center.value)/obj.ref_impedance;
            
        end
        
        function ind = l(obj)
        
            ind=1/(2*pi*obj.f_center.value)^2/obj.c;
            
        end
        
        function res = r(obj)
        
            res = obj.q_unloaded.value/(2*pi*obj.f_center.value*obj.c);
            
        end

        function imp = z(obj,freq)
            
            adm=obj.y(freq);
            
            imp=inv(adm);
            
            
        end
        
        function adm = y(obj,freq)
        
            adm = obj.var.y(freq)+obj.ind.y(freq)+obj.resis.y(freq);
            
        end
        
        function g=get_normalized_param(obj,fc,fbw)
        
            g=obj.c*fbw*2*pi*fc*obj.ref_impedance;
          
        end
       
    end

end
