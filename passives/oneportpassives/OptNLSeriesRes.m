classdef OptNLSeriesRes < OnePortNLRes    
%    
% Implements a series nonlinear resonator with nonlinear cap
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
       
        function obj=OptNLSeriesRes(varargin)
            
            obj=obj@OnePortNLRes(varargin{:});
            obj.paramchange;
            obj.label ='NLRes';
            addlistener (obj.f_center,'ValueUpdate',@obj.paramchange);
            addlistener (obj.q_loaded,'ValueUpdate',@obj.paramchange);
            addlistener (obj.q_unloaded,'ValueUpdate',@obj.paramchange);
        
            obj.q_unloaded.optimizable=false;
            obj.var.mod_phase.optimizable=false;
        
        end
        
        function cap = c(obj)
        
            cap=1/(2*pi*obj.f_center.value)^2/obj.l;
            
        end
        
        function ind = l(obj)
        
            ind=obj.q_loaded.value*obj.ref_impedance/(2*pi*obj.f_center.value);
            
        end
        
        function res = r(obj)
        
            res = (2*pi*obj.f_center.value*obj.l)/obj.q_unloaded.value;
            
        end
        
        function imp = z(obj,freq)
            
            imp=obj.var.z(freq)+obj.ind.z(freq)+obj.resis.z(freq);
            
        end
        
        function adm = y(obj,freq)
        
            imp=obj.z(freq);
            
            adm=pinv(imp);
            
        end
       
    end
        
end
