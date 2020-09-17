function plot_s11(obj,freq,z0,varargin)

for i=1:length(freq)
   
    s=obj.convert_ABCD_to_S(obj.ABCD(freq(i)),z0);
    
    s11(i)=s(1,1);
    
end

f=figure;

ax=axes;

plot(ax,freq,20*log10(abs(s11)));

xlabel('Frequency');
ylabel('S_{11} [dB]');
axis tight;

ylim([-Inf 0])

if ~isempty(varargin)
    
    if strcmp(varargin{1},{'h','hold'})
       
        return
    
    end
        
else
    
    h=input("Press to close");
    f.delete;
    
end
