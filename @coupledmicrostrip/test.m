function test(obj)

    defaultgraph;
    
    frequencies=linspace(10^6,10^9,1001);
    
    thetas=zeros(1,length(frequencies));
    
    for i=1:length(frequencies)
       
        thetas(i)=obj.get_phase_lag(frequencies(i));
        
    end
    
    p=semilogx(frequencies,thetas);



end
