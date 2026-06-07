function [d, error_estimate] = diff_quotient(f, x, h)
    f_prime = (f(x + h) - f(x)) / h;
    d = f_prime;
    error_estimate = h;

    fprintf('Derivative: %f\n', d);
    fprintf('Error Estimate: %f\n', error_estimate);
end
