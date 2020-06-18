classdef (Abstract) OnePortPassive < handle &...
                                     matlab.mixin.Heterogeneous & ...
                                     GetSetOptParam
   
%     
% interface for one port passives
% member of Heterogeneous
% 
% Abstract:
% z(freq)         -> oneport has to have a z(f) and y(f) functions
% y(freq)
%
% Public:
% get_opt_param() -> defines base method, needs to be overridden 
%                    in case subclass is not a opt_param

    methods (Abstract)
        
        imp=z(obj,freq);
        adm=y(obj,freq);
        
    end
    
    methods 
       
        function m = seriesABCD(obj, freq)
            
            nfreq=length(freq);
            
            a=ones(nfreq);
            b=diag(obj.z(freq));
            c=zeros(nfreq);
            d=ones(nfreq);
            
            m= [ a b ; c d];
            
        end
        
        function m = shuntABCD(obj, freq)
            
            nfreq=length(freq);
            
            a=ones(nfreq);
            b=zeros(nfreq);
            c=diag(obj.y(freq));
            d=ones(nfreq);
            
            m= [ a b ; c d];
        end     
        
        function opt_par = get_opt_param(obj)
        
            opt_par=[];
            
            if obj.optimizable 
                
                opt_par=obj;
                
            end
        
        end
        
    end

end

