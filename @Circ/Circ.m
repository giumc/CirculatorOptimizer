classdef Circ <handle

    properties (Access=private,Constant)
        
       fUnit=struct('name','Hz','scale',1);
       
       loadimpedance=1;
       
       harmonics=3;
       
       f_center=1;
       
       n_freqs=2*Circ.harmonics+1;%tmpvar
       
    end
    
    properties (Access=private)
        
        x0bar=0.06;
        
        y0bar=0.02;
        
        dxbar=0.3;
        
        dybar=0.04;
        
        dxtext=0.035;
        
    end %graphics
    
    properties
       
       f_mod=opt_param(0.1);
       
       f_array=Circ.f_center/2:Circ.fcenter/100:Circ.f_center*3/2;
       
       ABCD=1;%tmpvar
       
       goal=struct(...
            'direction',1,...
            'IL_BW',0.25,...
            'ISO_BW',0.25);
        
       design=choosepassive('LCbandpass');
       modratio=0.1;
       moddepth=0.1;
       phases=[0 120 240];
       cave=0;
       bounds=0;
       optimizand=0;
       sparam=struct();
       error=1;
       fig=[];
       ui_bar=[];
       ui_text=[];
       ui_tab=[];
       ui_startbutton=[];
       ui_stopbutton=[];
       optimsetup=struct();
       stopoptim=0;
    end
end
