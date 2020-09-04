cap_parplate;
        cap_fringe;
        cap_fringe_even;
        cap_coupl_air;
        cap_coupl_sub;
        
        cap_even;
        cap_odd;
        
        %all eqns are from Hong-Lancaster, Chap 4
        function cap_parplate=get.cap_parplate(coupledmicrostrip)
            cap_parplate=coupledmicrostrip.line.epsilon_tot * ...
                coupledmicrostrip.line.width / ...
                coupledmicrostrip.line.thickness;
        end
        
        function cap_fringe=get.cap_fringe(coupledmicrostrip)
            cap_fringe=1/2 * ( sqrt(coupledmicrostrip.line.epsilon_eff) / ...
                coupledmicrostrip.line.c_0 / coupledmicrostrip.line.Z_line)...
                - coupledmicrostrip.cap_parplate;
        end
        
        function cap_fringe_even=get.cap_fringe_even(coupledmicrostrip)
            y=coupledmicrostrip.spacing/coupledmicrostrip.line.thickness;
            A=exp( -0.1* exp ( 2.33 - 2.53 *coupledmicrostrip.line.width/ ...
                coupledmicrostrip.line.thickness ) ); 
            cap_fringe_even=coupledmicrostrip.cap_fringe /...
                (1+A / y * ( tanh ( 8 * y ) ) );
        end
               
        function cap_coupl_air=get.cap_coupl_air(coupledmicrostrip)
             y= coupledmicrostrip.spacing / ...
                 coupledmicrostrip.line.thickness;
             z= coupledmicrostrip.line.width / ...
                 coupledmicrostrip.line.thickness;

             k= y / (y + z) ;

             kp= sqrt( 1- k^2 );

             if k^2 >= 0 && k^2 < 0.5
                 gamma= 1 / pi * log (2 * (1 + sqrt (kp) ) /...
                     (1-sqrt( kp ) ) )  ;
             else
                 if k^2 <= 1 && k^2 >= 0.5
                     gamma= pi / log (2 * (1 + sqrt (k) ) / ...
                         (1 - sqrt (k) ) ) ;
                 else
                     fprintf('Failed to evaluate coupling capacitance, warning');
                     cap_coupl_air=[];
                     return;
                 end
             end
             cap_coupl_air = coupledmicrostrip.line.eps_0*gamma;
        end
        
        function cap_coupl_sub=get.cap_coupl_sub(coupledmicrostrip)
            cap_coupl_sub = coupledmicrostrip.line.eps_tot / pi * ...
                log ( coth ( pi / 4 * coupledmicrostrip.spacing / ...
                coupledmicrostrip.line.thickness ) ) +...
                0.65 * coupledmicrostrip.cap_fringe * ...
                ( 0.02 * sqrt (coupledmicrostrip.eps_r) / ...
                ( coupledmicrostrip.spacing / coupledmicrostrip.line.thickness )...
                + 1 - 1 / coupledmicrostrip.line.eps_r ) ;
        end
        
        function cap_even=get.cap_even(coupledmicrostrip)
            cap_even = coupledmicrostrip.cap_parplate + ...
                coupledmicrostrip.cap_fringe + ...
                coupledmicrostrip.cap_fringe_even ;
        end
        
        function cap_odd = get.cap_odd( coupledmicrostrip )
            cap_odd = coupledmicrostrip.cap_parplate + ...
                coupledmicrostrip.cap_fringe + ...
                coupledmicrostrip.cap_coupl_sub + ...
                coupledmicrostrip.cap_coupl_air ;
        end
     
