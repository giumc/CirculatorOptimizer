function elem=set_components(obj)

    %NormalizedFilter implementation
    
    coeffs =[1 obj.get_coeffs];
    
    for i=1:length(coeffs)

        if i<length(coeffs) && i>1

            if mod(i,2)==1 %odd

                elem(i)=OptCap(coeffs(i));

            else %even

                elem(i)=OptInd(coeffs(i)); 

            end

        else

            if i==1
                
                elem(i)=OptResistor(1);
            
            else
                
                if i==length(coeffs)
                    
                    if mod(i,2)==1 %odd

                        elem(i)=OptResistor(1/coeffs(i));

                    else

                        elem(i)=OptResistor(coeffs(i));

                    end
                    
                end
                
            end
            
        end

    end
    
    for i=1:length(elem)
        
        elem(i).optimizable=false;
        
    end
    
    obj.components=elem;

end
