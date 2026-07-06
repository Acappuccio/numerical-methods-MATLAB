function [] = demo_compare_derivatives()
    if isfolder('functions')
        addpath('functions')
    elseif isfolder('../functions')
        addpath('../functions')
    end

    fprintf('=== Numerical Differentiation Comparison ===\n\n');
    fprintf('Enter your function using x as the variable.\n');
    fprintf('Examples: sin(x)   x.^2-4   exp(x)   cos(x).*x\n\n');

    f_str = input('f(x) = ', 's');

    try
        f = str2func(['@(x) ' f_str]);
        f(1.0);
    catch
        fprintf('Invalid function.\n');
        return;
    end

    n = input('Derivative order for nth_derivative: ');

    fprintf('Do you know the true derivative? (y/n): ');
    has_true = strcmpi(input('', 's'), 'y');

    if has_true
        true_str = input('True derivative = ', 's');
        try
            true_f = str2func(['@(x) ' true_str]);
            true_f(1.0);
        catch
            fprintf('Could not parse true derivative. Using Five-Point as reference.\n');
            has_true = false;
        end
    end

    x_range = -2:0.001:2;
    h = 0.1;

    d_diff = arrayfun(@(x) call_diff(f, x, h), x_range);
    d_five = arrayfun(@(x) call_five(f, x, h), x_range);
    d_sym  = arrayfun(@(x) call_sym(f, x, h), x_range);
    d_nth  = arrayfun(@(x) call_nth(f, x, h, n), x_range);

    if has_true
        ref = true_f(x_range);
        ref_label = 'True Derivative';
    else
        ref = d_five;
        ref_label = 'Five-Point Stencil Reference';
    end

    figure('Name','Numerical Differentiation Analysis');
    sgtitle(['f(x) = ' f_str ' | h = ' num2str(h)]);

    subplot(2,1,1);
    plot(x_range, f(x_range), 'b-', ...
         x_range, d_diff, 'r--', ...
         x_range, d_five, 'g-.', ...
         x_range, d_sym, 'm:', ...
         x_range, d_nth, 'c-', ...
         'LineWidth', 1.5);

    title('Function and Derivative Approximations');
    legend('f(x)', 'Diff Quotient', 'Five-Point', 'Sym Diff', ['Nth Deriv (n=' num2str(n) ')']);
    xlabel('x');
    ylabel('y');

    subplot(2,1,2);
    plot(x_range, abs(d_diff - ref), 'r--', ...
         x_range, abs(d_five - ref), 'g-.', ...
         x_range, abs(d_sym - ref), 'm:', ...
         x_range, abs(d_nth - ref), 'c-', ...
         'LineWidth', 1.5);

    title(['Absolute Error vs ' ref_label]);
    legend('Diff Quotient', 'Five-Point', 'Sym Diff', ['Nth Deriv (n=' num2str(n) ')']);
    xlabel('x');
    ylabel('Absolute Error');

    fprintf('\n=== ACCURACY SUMMARY ===\n');
    fprintf('Diff Quotient:    Max=%.2e  Avg=%.2e\n', max(abs(d_diff - ref)), mean(abs(d_diff - ref)));
    fprintf('Five-Point:       Max=%.2e  Avg=%.2e\n', max(abs(d_five - ref)), mean(abs(d_five - ref)));
    fprintf('Sym Diff:         Max=%.2e  Avg=%.2e\n', max(abs(d_sym - ref)), mean(abs(d_sym - ref)));
    fprintf('Nth Deriv (n=%d): Max=%.2e  Avg=%.2e\n', n, max(abs(d_nth - ref)), mean(abs(d_nth - ref)));
end

function d = call_diff(f, x, h)
    [d, ~] = diff_quotient(f, x, h);
end

function d = call_five(f, x, h)
    [d, ~] = FivePoint_Stencil(f, x, h);
end

function d = call_sym(f, x, h)
    [d, ~] = SymDiff_quotient(f, x, h);
end

function d = call_nth(f, x, h, n)
    [d, ~] = nth_derivative(f, x, h, n);
end
