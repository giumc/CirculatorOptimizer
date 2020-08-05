classdef OptMEMSBPFilt < OptLadderFilt
     
    properties 
    
        label="MEMS Bandpass ladder filter";
        
    end
    
    properties (Access=private,Constant)
        
        def_f_c=1e9;
        
        def_kt2=0.03;
        
        def_ratio_cap=2;
        
        def_q_u=1e3;
        
    end

    properties (SetAccess=protected)

        kt2 double;
        f_c double;
        ratio_cap double;
        q_u double;

    end
   
    methods (Access=protected)

       res=pick_resonator(obj,n_res);
       m=ABCD(obj,freq);
       update_filt(obj);
       init_filt(obj,varargin);

    end

    methods 

        function obj=OptMEMSBPFilt(varargin)

            obj.init_filt(varargin{:});

       end

        function set_kt2(obj,kt2)

            obj.kt2=kt2;

            res=obj.resonators;

            for i=1:length(res)

                res(i).kt2.set_value(kt2,'override');

            end

            obj.update_filt;

        end

        function set_f_c(obj,f_c)

            obj.f_c=f_c;

            res=obj.resonators;

            switch obj.lastres

                case 'shunt_res'

                    for i=1:length(res)

                    end

            end

            obj.update_filt;

        end

        function set_ref_impedance(obj,zref)

            obj.set_ref_impedance@OptLadderFilt(zref);

            obj.update_filt;

        end

        function set_q_u(obj,q_u)

            obj.q_u=q_u;

            res=obj.resonators;

            for i=1:length(res)

                res(i).q_unloaded.set_value(q_u,'override');

            end

        end
        
        function set_ratio_cap(obj,value)
        
            obj.ratio_cap=value;
            
            obj.update_filt;
        
        end
        
        function s=calculate_S_lin_response(obj,ftest)
        
            s=S_param_linear(obj.ABCD(ftest),obj.ref_impedance);
        
        end

    end

    methods (Access=protected,Static)

       function f_antires=f_antires(fres,kt2)

            f_antires=fres./(1+4/pi/pi*kt2);

       end

    end

end
