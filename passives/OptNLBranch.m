classdef (Abstract) OptNLBranch < TwoPortPassive & matlab.mixin.SetGet
   
    % interface class for nonlinear branches
    %
    % from TwoPortPassive, has to implement
    % ABCD method
    % label (string) properties
    %
    % a subclass of OptNLBranch needs to have:
    % passive property (TwoPortPassive)
    % nlres (OnePortNLRes)
    % 

    properties 
        passive ;
        nlres ;
        
    end
    
    methods 
        
        function adm = y_in(obj, z0, freq)
            % adm = y_in(obj,z0, freq) 
            % z0 is of type OnePortPassive
            m=obj.ABCD(freq);
            
            m_tot=m*z0.shuntABCD(freq);            
            [a,~,c,~]=ABCD_split(m_tot);
            
            adm = c/a;
        
        end
        
        function imp = z_in(obj, z0, freq)
        
            % adm = z_in(objz0, freq) 
            % z0 is of type OnePortPassive
            m=obj.ABCD(freq);
            
            m_tot=m*z0.shuntABCD(freq);
            
            [a,~,c,~]=ABCD_split(m_tot);
            
            imp = a/c;
        
        end
        
        function m = ABCD_term(obj, z0, freq)
            %m = multiABCD_term(obj,z0,freq)
            % z0 is of type OnePortPassive
            adm_eq = obj.y_in(z0,freq);
            
            a = diag(ones (1,length(adm_eq)));
            b = diag(zeros(1,length(adm_eq)));
            c = diag(adm_eq);
            d = diag(ones (1,length(adm_eq)));
            
            m= [ a b ; c d];
            
        end
        
        function set.passive(obj,value)
            
            if ~isa(value,'TwoPortPassive')
                error('passive property needs to be member of TwoPortPassive');
            else
                obj.passive=value; 
            end
            
        end
        
        function set.nlres(obj,value)
            
            if ~isa(value,'OnePortNLRes')
                error('nlres property needs to be member of OnePortNLRes');
            else
                obj.nlres=value; 
            end
            
        end
    end
    
end
