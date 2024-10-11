function [root, iterations, log] = newton_raphson(f, df, x0, max_iter, tol)
    x = x0;
    iterations = 0;
    log = [];
    
    while iterations < max_iter
        fx = f(x);
        dfx = df(x);
        
        % Log current state
        log = [log; iterations+1, x, fx, dfx];
        
        % Check if we've found the root within tolerance
        if abs(fx) < tol
            root = x;
            iterations = iterations + 1;
            return;
        end
        
        % Update x
        x_new = x - fx / dfx;
        
        % Check for convergence
        if abs(x_new - x) < tol
            root = x_new;
            iterations = iterations + 1;
            return;
        end
        
        x = x_new;
        iterations = iterations + 1;
    end
    
    root = x;
    warning('Maximum iterations reached. Returning best approximation.');
end