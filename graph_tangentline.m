function [] = graph_tangentline(x_range, f, h, n)
    y = f(x_range);
    derivatives = {
        (f(x_range + h) - f(x_range)) / h, 
        (-f(x_range + 2 * h) + 8 * f(x_range + h) - 8 * f(x_range - h) + f(x_range - 2 * h)) / (12 * h),
        polyval(polyfit(x_range, y, n), x_range), 
        (f(x_range + h) - f(x_range - h)) / (2 * h) 
    };
    tangent_lines = cellfun(@(d) compute_tangent_line(x_range, y, d), derivatives, 'UniformOutput', false);
    figure;
  for i = 1:length(derivatives)
    subplot(2, 2, i);
    plot(x_range, y, 'b-', x_range, derivatives{i}, '--', 'LineWidth', 2);
    hold on;
    plot(x_range, tangent_lines{i}, 'k:', 'LineWidth', 1);
    plot_intersection(x_range, tangent_lines{i}, x_range, derivatives{i});
    hold off;
    title(get_method_name(i));
    legend('Original Function', 'Derivative', 'Tangent Line');
    xlabel('x');
    ylabel('y');
  end
end
function tangent_line = compute_tangent_line(x, y, slope)
    tangent_line = slope .* (x - x(1)) + y(1);
end
function plot_intersection(x1, y1, x2, y2)
    x_intersect = linspace(max(min(x1), min(x2)), min(max(x1), max(x2)), 100);
    y_intersect = interp1(x1, y1, x_intersect) - interp1(x2, y2, x_intersect);
    intersections = find(y_intersect .* circshift(y_intersect, [0, 1]) <= 0);
    hold on;
    plot(x_intersect(intersections), zeros(size(intersections)), 'ko');
    hold off;
end
function method_name = get_method_name(method_index)
    method_names = {'Difference Quotient', 'Five-Point Stencil', 'Nth Derivative', 'Symmetric Diff Quotient'};
    method_name = method_names{method_index};
end