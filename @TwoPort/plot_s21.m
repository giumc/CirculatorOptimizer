function plot_s21(obj,freq,z0,varargin)

for i=1:length(freq)
   
    s=obj.convert_ABCD_to_S(obj.ABCD(freq(i)),z0);
    
    s21(i)=s(2,1);
    
end

f=figure;

ax=axes;

plot(ax,freq,20*log10(abs(s21)));

xlabel('Frequency');
ylabel('S_{21} [dB]');
axis tight;

if ~isempty(varargin)
    
    if strcmp(varargin{1},{'h','hold'})
       
        return
    
    end
        
else
    
    h=input("Press to close");
    f.delete;
    
end
