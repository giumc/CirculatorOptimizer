classdef OnePortPiezoRes < OnePortRes
    
    properties (Access=private,Constant)
       
        def_kt2=0.02;
        def_q=1000;
        def_f_res=1e9;
        def_label="MEMSres";
        
    end
    
    properties (SetAccess=protected)
        
        kt2 OptParam;
        
        q_unloaded OptParam;
        
        z_match OptResistor;
        
    end
    
    methods 
   
        function obj=OnePortPiezoRes()
            
            obj.init_res;
            obj.set_default_labels;
            obj.label=obj.def_label;
            
        end
       
        function val=y(obj,freq)
        
            z=diag(obj.r*ones(1,length(freq)))+diag(1i*2*pi*obj.l*freq)+diag(1./(1i*2*pi*obj.c*freq));
            
            y=inv(z);
            
            val=y+diag(1i*2*pi*obj.c0.value*freq);
        
        end
        
        function val=z(obj,freq)
        
            y=obj.y(freq);
            
            val=inv(y);
        
        end
        
        function p=get_OptParam(obj)
        
            p=[];
            
            if obj.f_center.optimizable
                
                p=[p obj.f_center];
                
            end
            
            if obj.kt2.optimizable
               
                p=[p obj.kt2];
                
            end
                
            if obj.q_unloaded.optimizable
                
                p=[p obj.q_unloaded];
                
            end
            
            if obj.z_match.optimizable
                
                p=[p obj.c0];
                
            end
            
        end
        
    end
    
    methods (Access=protected)
       
        function cm=c(obj)
            
            cm=(8/(pi^2))*obj.c0*obj.kt2.value;
            
        end
        
        function lm=l(obj)
        
            lm=(pi^2/8)/((obj.f_center.value*2*pi)^2*obj.c0*obj.kt2.value);
        
        end
        
        function rm=r(obj)
        
            rm=(pi^2)/8/((2*pi*obj.f_center.value)*obj.kt2.value*obj.q_unloaded.value*obj.c0);
        
        end
        
        function c=c0(obj)
            
            c=1/(2*pi*obj.f_center.value*obj.z_match.value);
        
        end
        
        init_res(obj);
        
        set_default_labels(obj);
        
        update_labels(obj);
        
    end
    
end
        
    
