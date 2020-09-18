function Z_even=get_Z_even(obj)

% eps_r=obj.epsilon_r;

g=obj.spacing / obj.thickness;

u=obj.width / obj.thickness;

q1 = 0.8685 * u ^ 0.194 ;

q2 = 1 +0.7519 * g + 0.189 * g^2.31;

q3 = 0.1975 + (16.6 + (8.4 / g ) ^6) ^(-0.387 ) + 1/ 241 *...
    log( g^10 / ( 1 + ( g/3.4 )^10 ) ); 

q4 = 2 * q1 / q2 * 1 / ( u ^ (q3) *exp( -g ) + ...
    ( 2 + exp( -g ) ) * u^( -q3 ) );

Z_even = obj.get_Z_line * ...
    sqrt ( obj.get_epsilon_eff / ...
            obj.get_epsilon_even ) /...
    (1 - q4 * sqrt( obj.get_epsilon_eff ) * ...
    obj.get_Z_line/377 ) ;

%needs to implement from page 89 chap 4 
    
end
