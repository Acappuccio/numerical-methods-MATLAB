function [d, error_estimate] = SymDiff_quotient(f, x, h)
    f_prime = (f(x + h) - f(x - h)) / (2 * h);
    d = f_prime;
    error_estimate = h^2;

    fprintf('Derivative: %f\n', d);
    fprintf('Error Estimate: %f\n', error_estimate);
end
