classdef (Abstract) TwoPortPassive < handle & GetSetOptParam
    
    properties (Abstract)
        
        label string;
        
    end
    
    methods (Abstract)
        
        m = ABCD (obj,freq)
        
    end
    
    methods 
       
        function adm = y_in(obj, z0, freq, port)
            % adm = y_in(obj,z0, freq,port) 
            % z0 is of type OnePortPassive
            
            if port==1
                m=obj.ABCD(freq);
            else
                if port==2
                    m=ABCD_inverse(obj.ABCD(freq));
                end
                
            end
            
            m_tot=m*z0.shuntABCD(freq);            
            [a,~,c,~]=ABCD_split(m_tot);
            
            adm = c/a;
        end
        
        function imp = z_in(obj, z0, freq, port)
        
            % adm = z_in(objz0, freq) 
            % z0 is of type OnePortPassive
            if port==1
                m=obj.ABCD(freq);
            else
                if port==2
                    m=ABCD_inverse(obj.ABCD(freq));
                end
                
            end
            
            m_tot=m*z0.shuntABCD(freq);
            
            [a,~,c,~]=ABCD_split(m_tot);
            
            imp = a/c;
        
        end
        
        function m = ABCD_term(obj, z0, freq, port)
            %m = multiABCD_term(obj,z0,freq,port)
            % z0 is of type OnePortPassive
            adm_eq = obj.y_in(z0,freq,port);
            
            a = diag(ones (1,length(adm_eq)));
            b = diag(zeros(1,length(adm_eq)));
            c = diag(adm_eq);
            d = diag(ones (1,length(adm_eq)));
            
            m= [ a b ; c d];
            
        end
        
        function s = S_param(obj, z0, freq) 
            
            m = obj.ABCD(freq) ;
            
            z0 = z0.value ;
            
            [a ,b ,c ,d ] = ABCD_split(m);
            
            det = a*d-b*c ;
            denom = ( a + b./z0 +c .*z0 +d ); 
            s11 =( a + b./z0 -c .*z0 -d ) / denom ; 
            s21 = 2*det / denom ;
            s12 = 2 / denom ;
            s22 =(- a + b./z0 -c .*z0 +d ) / denom ; 
            
            s = [ s11 s12 ; s21 s22] ;
        
        end
        
        function s = S_param_linear(obj,z0,freq)
        
            stot = obj.S_param(z0,freq);
            
            fundindex =(length(freq)+1)/2;
            
            [s11, s12, s21, s22] = ABCD_split(stot);
            
            s = [ s11(fundindex,fundindex) s12(fundindex,fundindex);...
                  s21(fundindex,fundindex) s22(fundindex,fundindex)] ; 
              
        end
        
    end

end
