function y = error_function(goal,f)
    % return lsq error from goal function and test function f (array)
    % goal and f have to be of same length
    % calculates average of magnitude error
    %
    % -- adapted from @resonator/error function
    if ~ length(goal.goal) == length(f)
        error(0,"Mismatch in Goal length and function length");
    else
        
        if iscolumn(f)
            
            f=f.';
            
        end
        
        mag_err     =   norm_error(@(x) abs(x));

        %phase_err   =   norm_error(@(x) 180/pi*angle(x));

        y           =   mag_err;%( mag_err + phase_err ) ./ 2;

    end

    function y = norm_error(func)
        y = sum ( ...
            abs ( (func(f)  - func(goal.goal))) .^2 )./length(goal.goal);
    end

end

