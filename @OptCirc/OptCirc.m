classdef OptCirc <  CircGoal

    % Optimizable Circulator (member of TwoPortPassive)

    properties (Access=private,Constant)
        
        ref_impedance=1;

        harmonics=3;

        phases=[0 120 240]; 
        
        fpoints=101;

    end

    properties (Access=private)

        x0bar=0.06;

        y0bar=0.02;

        dxbar=0.3;

        dybar=0.04;

        dxtext=0.035;

        fig=[];

        ui_bar=[];

        ui_text=[];

        ui_tab=[];

        ui_startbutton=[];

        ui_stopbutton=[];

    end %graphics

    properties (SetAccess=private) 
        
        optimsetup=struct();
        
        stopoptim=0;
        
    end %optim variables

    properties 

       goal=CircGoal();

       design OptNLBranch ;

    end % design parameters

    methods %Constructor/De.structor

        function obj=OptCirc(varargin)

            obj.f_test=obj.calculate_frf();

            if ~isempty (varargin)

               for i=1:length(varargin)

                   if ischar(varargin{i})|| isstring(varargin{i})

                       switch varargin{i}

                           case 'order'

                               obj.design=OptBandPassFilt(varargin{i+1});

                       end

                   end

               end

            end

            if isempty(obj.design)

               obj.design=OptBandPassFilt(1);

            end

            
            obj.errorcalc;
            obj.newcircgoalplot;
            obj.addinteractivebar;
            obj.addoptbutton;

        end



        function delete(obj)
        
            obj.removeinteractivebar;
            obj.removecirctable;
            obj.removecircplot;
            obj.removeoptbutton;
            
        end
    end

    methods %Tools

        updateoptimizand(circ)
        responsecalc(circ)
        errorcalc(circ)
        goalcalc(circ)
        updatedesign(circ)

        addinteractivebar(circ)
        removeinteractivebar(circ)
        disableinteractivebar(circ)
        enableinteractivebar(circ)
        updateinteractivebar(circ)

        tab=newcirctable(circ)
        tab=updatecirctable(circ)
        removecirctable(circ)

        fig=newcircgoalplot(circ)
        fig=updatecircgoalplot(circ)       
        removecircplot(circ)

        initoptimization(circ)
        multistartoptim(circ)

        addoptbutton(circ)
        removeoptbutton(circ)

        savecirc(circ)
    end

    methods (Access=protected)
        
        function f=calculate_frf(obj)
                f_min = max(...
                    0,...
                    min(obj.f_center*(1-2*obj.tx_bandwidth),...
                        obj.f_center*(1-2*obj.iso_bandwidth)));
                f_max= max(...
                    obj.f_center*(1+2*obj.iso_bandwidth),...
                    obj.f_center*(1+2*obj.tx_bandwidth));
                f=linspace(f_min,f_max,obj.fpoints);
                
        end
        
        function init(circ)
            circ.goalcalc;
            circ.responsecalc;
            circ.newcircgoalplot;
            circ.addinteractivebar;
    %             circ.updateinteractivebar;
        end
        
        function n=n_freqs(obj)
        
            n=2*obj.harmonics+1;
            
        end

        m=multiABCD(obj,freq);
        
    end

end
