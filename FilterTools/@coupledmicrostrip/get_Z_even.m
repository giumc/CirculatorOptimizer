function Z_even=get_Z_even(obj,freq)

% eps_r=obj.epsilon_r;
q=obj.get_q(freq);

Z_even = obj.get_Z_line * ...
    sqrt ( obj.get_epsilon_eff / ...
            obj.get_epsilon_even(0) ) /...
    (1 - q(4) * sqrt( obj.get_epsilon_eff ) * ...
    obj.get_Z_line/377 ) ;

%needs to implement from page 89 chap 4 
    
end
