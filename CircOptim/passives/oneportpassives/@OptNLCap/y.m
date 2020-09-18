function adm = y (obj,freq)

    c0 = obj.capacitance.value;

    eps = obj.mod_depth.value;

    phase = pi/180*obj.mod_phase.value;

    ystat= diag(1i*2*pi*freq*c0);
    
    ymod=zeros(length(freq));
    
%   Simple expansion

    for i=1:length(freq)
        
        ymod(i,i)=1;
        
        if i<length(freq)
       
            ymod(i,i+1)=exp(-1i*phase)*eps*...
                freq(i)/2/freq(i+1);

            ymod(i+1,i)=exp(1i*phase)*eps*...
                freq(i+1)/2/freq(i);
           
        end
        
    end
% 
% %   Nonlinear expansion
%     for i=1:length(freq)
%        
%         ymod(i,i)=1/2*(2+eps^2);
%         
%     end
% 
%     for i=1:length(freq)
%     
%         if i<length(freq)
%             
%         ymod(i,i+1)=-1i*sqrt(-exp(-2*1i*phase))*eps*(4+3*eps^2)*...
%             freq(i)/8/freq(i+1);
%         
%         ymod(i+1,i)=-1i*sqrt(-exp(-2*1i*phase))*eps*(4+3*eps^2)*...
%             freq(i+1)/8/freq(i);
%         
%         end
%         
%         if i<length(freq)-1
%             
%             ymod(i,i+2)=-1i*sqrt(-exp(-4*1i*phase))*eps^2*...
%                 freq(i)/4/freq(i+2);
% 
%             ymod(i+2,i)=-1i*sqrt(-exp(-4*1i*phase))*eps^2*...
%                 freq(i+2)/4/freq(i);
% 
%         end
%         
%         if i<length(freq)-2
%             
%             ymod(i,i+3)=-1i*sqrt(-exp(-6*1i*phase))*eps^3*...
%                 freq(i)/8/freq(i+3);
% 
%             ymod(i+3,i)=-1i*sqrt(-exp(-6*1i*phase))*eps^3*...
%                 freq(i+3)/8/freq(i);
% 
%         end
%         
%     end
    
    adm=ymod*ystat;
    
end
