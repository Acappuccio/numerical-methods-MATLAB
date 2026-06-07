function [] = demo_compare_derivatives()
fprintf('=== Numerical Differentiation Comparison ===\n\n');
fprintf('Enter your function using x as variable.\n');
fprintf('Use .^ for powers, .* for multiply\n');
fprintf('Examples: sin(x)   x.^2-4   exp(x)   cos(x).*x\n\n');

f_str = input('f(x) = ', 's');
try
    f = str2func(['@(x) ' f_str]);
    f(1.0);
catch
    fprintf('Invalid function.\n'); return;
end

n = input('Derivative order (1=first, 2=second, etc): ');

fprintf('Do you know the true derivative? (y/n): ');
has_true = strcmpi(input('', 's'), 'y');
if has_true
    true_str = input('True derivative = ', 's');
    try
        true_f = str2func(['@(x) ' true_str]);
    catch
        fprintf('Could not parse. Using Five-Point as reference.\n');
        has_true = false;
    end
end

x_range = -2:0.001:2;
h = 0.1;

d_diff = (f(x_range+h) - f(x_range)) / h;
d_five = (-f(x_range+2*h)+8*f(x_range+h)-8*f(x_range-h)+f(x_range-2*h))/(12*h);
d_sym  = (f(x_range+h) - f(x_range-h)) / (2*h);
d_nth  = zeros(size(x_range));
for k = 0:n
    d_nth = d_nth + (-1)^k * nchoosek(n,k) * f(x_range+(n-2*k)*h);
end
d_nth = d_nth / (2*h)^n;

if has_true
    ref = true_f(x_range);
    ref_label = 'True Derivative';
else
    ref = d_five;
    ref_label = 'Five-Point (reference)';
end

figure('Name','Numerical Differentiation Analysis');
sgtitle(['f(x) = ' f_str ' | h = ' num2str(h)]);

subplot(2,1,1);
plot(x_range,f(x_range),'b-',x_range,d_diff,'r--',...
    x_range,d_five,'g-.',x_range,d_sym,'m:',...
    x_range,d_nth,'c-','LineWidth',1.5);
title('Function and Derivative Approximations');
legend('f(x)','Diff Quotient','Five-Point','Sym Diff',['Nth (n=' num2str(n) ')']);
xlabel('x'); ylabel('y');

subplot(2,1,2);
plot(x_range,abs(d_diff-ref),'r--',...
    x_range,abs(d_five-ref),'g-.',...
    x_range,abs(d_sym-ref),'m:',...
    x_range,abs(d_nth-ref),'c-','LineWidth',1.5);
title(['Absolute Error vs ' ref_label]);
legend('Diff Quotient','Five-Point','Sym Diff',['Nth (n=' num2str(n) ')']);
xlabel('x'); ylabel('Absolute Error');

fprintf('\n=== ACCURACY SUMMARY ===\n');
fprintf('Diff Quotient:    Max=%.2e  Avg=%.2e\n',max(abs(d_diff-ref)),mean(abs(d_diff-ref)));
fprintf('Five-Point:       Max=%.2e  Avg=%.2e\n',max(abs(d_five-ref)),mean(abs(d_five-ref)));
fprintf('Sym Diff:         Max=%.2e  Avg=%.2e\n',max(abs(d_sym-ref)),mean(abs(d_sym-ref)));
fprintf('Nth Deriv (n=%d): Max=%.2e  Avg=%.2e\n',n,max(abs(d_nth-ref)),mean(abs(d_nth-ref)));
end