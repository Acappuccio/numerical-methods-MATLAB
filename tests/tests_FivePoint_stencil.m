function tests_FivePoint_stencil()
if isfolder('functions')
    addpath('functions')
elseif isfolder('../functions')
    addpath('../functions')
end

tests = {@test_trivial, @test_precision, @test_symmetry, @test_limiting, @test_crosscheck};

fprintf('=== Five-Point Stencil Tests ===\n\n');

for i = 1:length(tests)
    try
        feval(tests{i});
        fprintf('PASS: %s\n', func2str(tests{i}));
    catch E
        fprintf(2, 'FAIL: %s\n%s\n', func2str(tests{i}), E.message);
    end
end
end

function test_trivial()
f = @(x) 5;
[actual, ~] = FivePoint_Stencil(f, 2, 0.1);
expect = 0;
tolerance = 1e-6;

assert(abs(actual - expect) < tolerance, ...
    'Constant function derivative should be 0.');
end

function test_precision()
f = @(x) x.^2;
x = 3;
h = 1e-5;
[actual, ~] = FivePoint_Stencil(f, x, h);
expect = 2 * x;
tolerance = 1e-5;

assert(abs(actual - expect) < tolerance, ...
    'Derivative of x^2 at x=3 should be approximately 6.');
end

function test_symmetry()
f = @(x) x.^3;
x = 2;
h = 0.1;

[actual_forward, ~] = FivePoint_Stencil(f, x, h);
[actual_backward, ~] = FivePoint_Stencil(f, x, -h);

tolerance = 1e-6;

assert(abs(actual_forward - actual_backward) < tolerance, ...
    'Five-point stencil should be symmetric for positive and negative h.');
end

function test_limiting()
f = @(x) sin(x);
x = 0;
h = 0.001;

[actual, ~] = FivePoint_Stencil(f, x, h);
expect = 1;
tolerance = 1e-6;

assert(abs(actual - expect) < tolerance, ...
    'Derivative of sin(x) at x=0 should be approximately 1.');
end

function test_crosscheck()
f = @(x) 2*x + 3;
x = 5;
h = 0.1;

[actual, ~] = FivePoint_Stencil(f, x, h);
expect = 2;
tolerance = 1e-6;

assert(abs(actual - expect) < tolerance, ...
    'Derivative of 2x + 3 should be 2.');
end
