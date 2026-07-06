function [d, error_estimate] = FivePoint_Stencil(f, x, h)
    f_prime = (-f(x + 2 * h) + 8 * f(x + h) - 8 * f(x - h) + f(x - 2 * h)) / (12 * h);
    d = f_prime;
    error_estimate = (h^4) / 30;

    fprintf('Derivative: %f\n', d);
    fprintf('Error Estimate: %f\n', error_estimate);
end
