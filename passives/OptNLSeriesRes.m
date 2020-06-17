classdef OptNLSeriesRes < OnePortNLRes    
    % member of OnePortNLRes
    %
    % 
    
    properties(Access=private,Constant)
        def_label='Non Linear Series LC Resonator';
    end
    
    methods 
       
        function obj=OptNLSeriesRes(varargin)
            
            obj=obj@OnePortNLRes(varargin{:});
            obj.label = obj.def_label;
            addlistener (obj.f_center,'ValueUpdate',@obj.paramchange);
            addlistener (obj.q_loaded,'ValueUpdate',@obj.paramchange);
            addlistener (obj.q_unloaded,'ValueUpdate',@obj.paramchange);
        end
    
    end
    
    methods 
        
        function cap = c(obj)
        
            cap=1/(2*pi*obj.f_center.value)^2/obj.l;
            
        end
        
        function ind = l(obj)
        
            ind=obj.q_loaded.value*obj.ref_impedance/(2*pi*obj.f_center.value);
            
        end
        
        function res = r(obj)
        
            res = (2*pi*obj.f_center.value*obj.l)/obj.q_unloaded.value;
            
        end
        
    end
    
    methods 
        
        function m = seriesABCD(obj,freq)
            
            m = obj.ind.seriesABCD(freq)*obj.var.seriesABCD(freq);
        
        end
        
        function m = shuntABCD(obj,freq)
            
            adm = obj.y(freq);
            
            a = diag(ones(1,length(adm)));
            b = diag(zeros(1,length(adm)));
            c = diag(adm);
            d = diag(ones(1,length(adm)));
            
            m = [a b ; c d];
            
        end
        
        function imp = z(obj,freq)
            
            [ ~ ,b ,~ ,d] = ABCD_split(obj.seriesABCD(freq));
            
            imp = b/d;
            
        end
        
        function adm = y(obj,freq)
        
            imp = obj.z(freq);
            adm = inv(imp);
            
        end
       
    end
    
    methods (Access=private)
        
        function paramchange(obj,~,~)
         
            obj.var.capacitance.set_value(obj.c,'override');
            obj.ind.set_value(obj.l,'override');
            obj.resis.set_value(obj.r,'override');
        end
        
    end
        
end
