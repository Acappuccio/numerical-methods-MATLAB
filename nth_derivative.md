# nth Derivative Difference Quotient

## Syntax

```matlab
[d, error_estimate] = nth_derivative(f, x, h, n)
```

## Description

Calculates a numerical approximation of the nth derivative of a function at a given point. The function uses a finite-difference style formula with a specified step size `h` and derivative order `n`.

This method is useful for estimating higher-order derivatives when an exact symbolic derivative is not available.

## Inputs

- `f` — Function handle to differentiate
- `x` — Point where the derivative is estimated
- `h` — Step size used for the finite-difference calculation
- `n` — Derivative order to approximate

## Outputs

- `d` — Estimated nth derivative at `x`
- `error_estimate` — Approximate error estimate based on the step size and derivative order

## Example

```matlab
f = @(x) x.^2;
[d, error_estimate] = nth_derivative(f, 1, 0.1, 2)
```

Expected derivative approximation:

```matlab
d = 2.0000
```

## Theory

This function approximates higher-order derivatives using repeated finite-difference behavior. It sums shifted function evaluations around the point `x`, weighted by binomial coefficients.

The derivative is approximated using:

```matlab
d = sum((-1)^k * nchoosek(n,k) * f(x + (n - 2*k)*h)) / (2*h)^n
```

for values of `k` from `0` to `n`.

Higher-order numerical derivatives can be sensitive to the step size `h`. Very large or very small values of `h` may increase approximation error or numerical instability.

## Reference

- https://en.wikibooks.org/wiki/Calculus/Higher_Order_Derivatives

## Related File

- `nth_derivative.m`
