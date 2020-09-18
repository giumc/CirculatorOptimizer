function Z_odd=get_Z_odd(obj)

g=obj.spacing / obj.thickness;

u=obj.width / obj.thickness;

q1 = 0.8685 * u ^ 0.194 ;

q2 = 1 +0.7519 * g + 0.189 * g^2.31;

q3 = 0.1975 + (16.6 + (8.4 / g ) ^6) ^(-0.387 ) + 1/ 241 *...
    log( g^10 / ( 1 + ( g/3.4 )^10 ) ); 

q4 = 2 * q1 / q2 * 1 / ( u ^ (q3) *exp( -g ) + ...
    ( 2 + exp( -g ) ) * u^( -q3 ) );

q5 = 1.794+1.14*log(1+0.638/(g+0.517*g^(2.43)));

q6 = 0.2305 + 1/281.3 * log( g^10 /(1+(g / 5.8)^10))...
    + 1 / 5.1 * log( 1 + 0.598 * g^1.154 );

q7 = (10 + 190 * g^2 ) / ( 1 +82.3 * g^3 ) ;

q8 = exp ( -6.5 -0.95 * log (g) - ( g / 0.15 ) ^5 );

q9 = log ( q7 ) * (q8 +1/16.5) ;

q10 = q4 - q5/q2 * exp( q6 * log (u) / u ^ q9 ) ;

Z_odd = obj.get_Z_line * ...
    sqrt ( obj.get_epsilon_eff /...
            obj.get_epsilon_odd ) /...
    (1 - q10 * sqrt( obj.get_epsilon_eff ) * ...
    obj.get_Z_line/377 ) ;

end
