function [] = graph_tangentline(x_range, f, h, n)

if isfolder('functions')
    addpath('functions')
elseif isfolder('../functions')
    addpath('../functions')
end

y = f(x_range);

d_diff = arrayfun(@(x) call_diff(f, x, h), x_range);
d_five = arrayfun(@(x) call_five(f, x, h), x_range);
d_nth  = arrayfun(@(x) call_nth(f, x, h, n), x_range);
d_sym  = arrayfun(@(x) call_sym(f, x, h), x_range);

derivatives = {d_diff, d_five, d_nth, d_sym};

tangent_lines = cellfun(@(d) compute_tangent_line(x_range, y, d), ...
    derivatives, 'UniformOutput', false);

figure;

for i = 1:length(derivatives)
    subplot(2, 2, i);
    plot(x_range, y, 'b-', x_range, derivatives{i}, '--', 'LineWidth', 2);
    hold on;
    plot(x_range, tangent_lines{i}, 'k:', 'LineWidth', 1);
    hold off;
    title(get_method_name(i));
    legend('Original Function', 'Derivative', 'Tangent Line');
    xlabel('x');
    ylabel('y');
end
end

function tangent_line = compute_tangent_line(x, y, slope)
mid_index = round(length(x) / 2);
x0 = x(mid_index);
y0 = y(mid_index);
m = slope(mid_index);

tangent_line = y0 + m .* (x - x0);
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

function method_name = get_method_name(method_index)
method_names = {'Difference Quotient', 'Five-Point Stencil', ...
    'Nth Derivative', 'Symmetric Diff Quotient'};
method_name = method_names{method_index};
end
