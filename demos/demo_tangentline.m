function [] = demo_tangentline()

% Add functions folder if it exists
if isfolder('functions')
    addpath('functions')
elseif isfolder('../functions')
    addpath('../functions')
end

fprintf('=== Tangent Line Visualization ===\n\n');
fprintf('This demo compares tangent lines generated using the four numerical differentiation methods.\n\n');

fprintf('Enter your function using x as the variable.\n');
fprintf('Examples: sin(x)   x.^2-4   exp(x)   cos(x).*x\n\n');

f_str = input('f(x) = ','s');

try
    f = str2func(['@(x) ' f_str]);
    f(1);
catch
    fprintf('Invalid function.\n');
    return
end

h = input('Step size h (recommended 0.1): ');
x_start = input('X range start: ');
x_end = input('X range end: ');

x_range = x_start:0.01:x_end;

graph_tangentline(x_range,f,h,2);

sgtitle(['Tangent Line Visualization: f(x) = ' f_str ', h = ' num2str(h)])

end
