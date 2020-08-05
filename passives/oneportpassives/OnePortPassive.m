classdef (Abstract) OnePortPassive < matlab.mixin.Heterogeneous & ...
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
% get_OptParam() -> defines base method, needs to be overridden 
%                    in case subclass is not a OptParam
% set_bounds() -> defines base method, needs to be overridden 
%                    in case subclass is not a OptParam

    methods (Abstract)
        
        imp=z(obj,freq);
        adm=y(obj,freq);
        
    end
    
    methods 
       
        function m = seriesABCD(obj, freq)
            
            nfreq=length(freq);
            
            a=diag(ones(1,nfreq));
            b=obj.z(freq);
            c=diag(zeros(1,nfreq));
            d=diag(ones(1,nfreq));
            
            m= [ a b ; c d];
            
        end
        
        function m = shuntABCD(obj, freq)
            
            nfreq=length(freq);
            
            a=diag(ones(1,nfreq));
            b=diag(zeros(1,nfreq));
            c=obj.y(freq);
            d=diag(ones(1,nfreq));
            
            m= [ a b ; c d];
        end     
        
        function opt_par = get_OptParam(obj)
        
            opt_par=[];
            
            if obj.optimizable 
                
                opt_par=obj;
                
            end
        
        end
        
        function flag=isempty(obj)
            
            flag=isemptyobj(obj);
        
        end
        
    end

end

