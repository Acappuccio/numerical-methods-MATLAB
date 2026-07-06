function [] = graph_illustrate_differentiation(x_range, f, h, n)

if isfolder('functions')
    addpath('functions')
elseif isfolder('../functions')
    addpath('../functions')
end

y = f(x_range);

d_diff_quotient = arrayfun(@(x) call_diff(f, x, h), x_range);
d_five_point_stencil = arrayfun(@(x) call_five(f, x, h), x_range);
d_nth_derivative = arrayfun(@(x) call_nth(f, x, h, n), x_range);
d_sym_diff_quotient = arrayfun(@(x) call_sym(f, x, h), x_range);

subplot(2, 1, 1);
plot(x_range, y, 'b-', ...
    x_range, d_diff_quotient, 'r--', ...
    x_range, d_five_point_stencil, 'g-.', ...
    x_range, d_sym_diff_quotient, 'm:', ...
    'LineWidth', 2);

title('Function and First-Derivative Approximations');
legend('Original Function', 'Difference Quotient', 'Five-Point Stencil', 'Symmetric Diff Quotient');
xlabel('x');
ylabel('y');

subplot(2, 1, 2);
plot(x_range, y, 'b-', ...
    x_range, d_diff_quotient, 'r--', ...
    x_range, d_five_point_stencil, 'g-.', ...
    x_range, d_nth_derivative, 'c-', ...
    x_range, d_sym_diff_quotient, 'm:', ...
    'LineWidth', 2);

title(['Nth Derivative Comparison (n = ' num2str(n) ')']);
legend('Original Function', 'Difference Quotient', 'Five-Point Stencil', 'Nth Derivative', 'Symmetric Diff Quotient');
xlabel('x');
ylabel('y');
end

function d = call_diff(f, x, h)
[d, ~] = diff_quotient(f, x, h);
end

function d = call_five(f, x, h)
[d, ~] = FivePoint_Stencil(f, x, h);
end

function d = call_nth(f, x, h, n)
[d, ~] = nth_derivative(f, x, h, n);
end

function d = call_sym(f, x, h)
[d, ~] = SymDiff_quotient(f, x, h);
end
