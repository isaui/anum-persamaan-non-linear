function [root, iterations, log] = bisection(func, a, b, max_iter, tol)
    % Check if the function changes sign over the interval
    fprintf("LETS GO\n")
    if func(a) * func(b) >= 0
        error('Function does not change sign over the given interval');
    end
    
    iterations = 0;
    log = [];
    
    while iterations < max_iter && (b - a) > tol
        % Calculate midpoint
        c = (a + b) / 2;
        
        % Log current state
        log = [log; iterations+1, a, b, c, func(c), abs(b-a)];
        
        % Check if we've found the root within tolerance
        if abs(func(c)) < tol
            root = c;
            iterations = iterations + 1;
            return;
        end
        
        % Determine which half to continue with
        if func(a) * func(c) < 0
            b = c;
        else
            a = c;
        end
        
        iterations = iterations + 1;
    end
    
    % If we've reached max iterations without finding a root
    root = (a + b) / 2;
    warning('Maximum iterations reached. Returning best approximation.');
end