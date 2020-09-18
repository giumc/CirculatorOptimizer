function s21=get_S21(obj,freq)

    elems=obj.get_components;
    
    for i=1:length(freq)
        
        f=freq(i);
        
        m(:,:)=diag(ones(2,1));
        
        for k=1:length(elems)
            
            if k<length(elems)&& k>1

                if mod(k,2)==1 %odd

                    m=m*elems(k).shuntABCD(f);

                else

                    m=m*elems(k).seriesABCD(f);

                end
                
%             else
%                 
%                 if k==1
%                     
%                     m=m*elems(k).seriesABCD(f);
%                 
%                 else
%                     
%                     if k==length(elems)
%                         
%                         m=m*elems(k).shuntABCD(f);
%                         
%                     end
%                     
%                 end
                
            end
            
        end
        
        [a , b ,c ,d ]= ABCD_split(m);
        
        zsource=elems(1).value;
        zload=elems(end).value;
        
        s21(i)=2*sqrt(zsource*zload)/...
            (a*zload+b+c*zsource*zload+d*zsource);
            
    end
    
end
