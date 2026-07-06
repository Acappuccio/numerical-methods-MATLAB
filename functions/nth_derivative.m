function [d, error_estimate] = nth_derivative(f, x, h, n)
    d = 0;
    for k = 0:n
        coefficient = (-1)^k * nchoosek(n, k);
        d = d + coefficient * f(x + (n - 2*k)*h);
    end
    d = d / (2 * h)^n;
    error_estimate = h^(n+1);
    
    fprintf('Derivative: %f\n', d);
    fprintf('Error Estimate: %f\n', error_estimate);
end

