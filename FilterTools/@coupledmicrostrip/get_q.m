function q= get_q(obj,freq)


    u=obj.get_width('mil')/obj.get_thickness('mil');
    
    g=obj.get_spacing('mil')/obj.get_thickness('mil');
    
    eps_r=obj.get_epsilon_r;
    
    f=obj.get_norm_freq(freq);

    q(1) = 0.8685 * u ^ 0.194 ;

    q(2) = 1 +0.7519 * g + 0.189 * g^2.31;

    q(3) = 0.1975 + (16.6 + (8.4 / g ) ^6) ^(-0.387 ) + 1/ 241 *...
        log( g^10 / ( 1 + ( g/3.4 )^10 ) ); 

    q(4) = 2 * q(1) / q(2) * 1 / ( u ^ (q(3)) *exp( -g ) + ...
        ( 2 - exp( -g ) ) * u^( -q(3) ) );

    q(5) = 1.794+1.14*log(1+0.638/(g+0.517*g^(2.43)));

    q(6) = 0.2305 + 1/281.3 * log( g^10 /(1+(g / 5.8)^10))...
        + 1 / 5.1 * log( 1 + 0.598 * g^1.154 );

    q(7) = (10 + 190 * g^2 ) / ( 1 +82.3 * g^3 ) ;

    q(8) = exp ( -6.5 -0.95 * log (g) - ( g / 0.15 ) ^5 );

    q(9) = log ( q(7) ) * (q(8) +1/16.5) ;

    q(10) = q(4) - q(5)/q(2) * exp( q(6) * log (u) / u ^ (-q(9)) ) ;
    
    
end
