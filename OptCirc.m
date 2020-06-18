classdef (Abstract) OptCirc <  CircGoal & ...
                    TwoPortPassive & ...
                    matlab.mixin.SetGet

% Interface for optimizable circulators
% inherits from CircGoal , TwoPortPassive and (Matlab) SetGet
%
% ------ PROPERTIES ------
%
% Protected Constant :
% harmonics 
% phases
% fpoints
%
% Protected :
% optimsetup
%
% Public :
% ftest 
%
% SetProtected :
% design    (set-controlled to be a OptNLBranch)
% 
% ------ METHODS ------
%
% Public: 
% ABCD(freq)        -> calculates ABCD matrix
% Protected :
%
% calculate_frf()   -> calculates ftest
% n_freqs()         -> calculates number of frequencies

    properties (Access=protected,Constant)

        harmonics=3;

        phases=[0 120 240]; 
        
        fpoints=101;

    end

    properties (Access=protected)

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

    properties (Access=protected) 
        
        optimsetup=struct();
        
    end %optim variables

    properties 

        f_test;
        
    end
    
    properties (SetAccess=protected) 

       design  ;
       
       ref_impedance OptResistor = OptResistor('value',50);

    end % design parameters

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
        
        function n=n_freqs(obj)
        
            n=2*obj.harmonics+1;
            
        end
      
    end

    methods 
       
        function set.design(obj,value)
            
            if ~isa(value,'OptNLBranch')
               
                error(strcat("Design property in OptCirc has to be",...
                    " a member of OptNLBranch"));
            else
                
                obj.design=value;
                
            end
            
        end
        
        function m = ABCD(obj,freq)
        
            var = obj.design.nlres.var;
            
            var.mod_phase.set_opt_param(obj.phases(1),'override');
            
            m = obj.design.ABCD(freq) ;
            
            var.mod_phase.set_opt_param(obj.phases(2),'override');
            
            m = m * obj.design.ABCD_term(obj.ref_impedance,freq,2);
                
            var.mod_phase.set_opt_param(obj.phases(3),'override');
            
            m = m * ABCD_inverse(obj.design.ABCD(freq)) ;
            
        end
        
        function opt_par = get_opt_param(obj)
            
            opt_par = obj.design.get_opt_param;
            
        end
    end
    
end
