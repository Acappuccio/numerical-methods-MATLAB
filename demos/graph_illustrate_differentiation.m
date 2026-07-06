function [] = graph_illustrate_differentiation(x_range, f, h, n)
    y = f(x_range);
    d_diff_quotient = (f(x_range + h) - f(x_range)) / h;
    d_five_point_stencil = (-f(x_range + 2 * h) + 8 * f(x_range + h) - 8 * f(x_range - h) + f(x_range - 2 * h)) / (12 * h);
    d_nth_derivative = zeros(size(x_range));
    for k = 0:n
        coefficient = (-1)^k * nchoosek(n, k);
        d_nth_derivative = d_nth_derivative + coefficient * f(x_range + (n - 2 * k) * h);
    end
    d_nth_derivative = d_nth_derivative / (2 * h)^n;
    d_sym_diff_quotient = (f(x_range + h) - f(x_range - h)) / (2 * h);

    subplot(2, 1, 1);
    plot(x_range, y, 'b-', x_range, d_diff_quotient, 'r--', x_range, d_five_point_stencil, 'g-.', x_range, d_sym_diff_quotient, 'm:', 'LineWidth', 2);
    title('Function and Derivatives');
    legend('Original Function', 'Difference Quotient', 'Five-Point Stencil', 'Symmetric Diff Quotient');
    xlabel('x');
    ylabel('y');
    
    subplot(2, 1, 2);
    plot(x_range, y, 'b-', x_range, d_diff_quotient, 'r--', x_range, d_five_point_stencil, 'g-.', x_range, d_nth_derivative, 'c-', x_range, d_sym_diff_quotient, 'm:', 'LineWidth', 2);
    title(['Nth Derivative (N = ' num2str(n) ')']);
    legend('Original Function', 'Difference Quotient', 'Five-Point Stencil', 'Nth Derivative', 'Symmetric Diff Quotient');
    xlabel('x');
    ylabel('y');
end


