# Difference Quotient

## Syntax

```matlab
[d, error_estimate] = diff_quotient(f, x, h)
```

## Description

Calculates the first derivative of a function at a given point using the forward difference quotient. This method estimates the slope by comparing the function value at `x` with the function value at `x + h`.

## Inputs

- `f` — Function handle to differentiate
- `x` — Point where the derivative is estimated
- `h` — Step size used for the forward difference calculation

## Outputs

- `d` — Estimated first derivative at `x`
- `error_estimate` — Approximate error estimate based on the step size

## Example

```matlab
f = @(x) x.^2;
[d, error_estimate] = diff_quotient(f, 2, 0.1)
```

Expected derivative approximation:

```matlab
d = 4.1000
```

## Theory

The forward difference quotient estimates the derivative by comparing the function value at `x` with the function value at a nearby point `x + h`.

The derivative is approximated using:

```matlab
f'(x) ≈ (f(x+h) - f(x)) / h
```

This method is simple and useful as a baseline numerical derivative method, but it is generally less accurate than centered methods such as the symmetric difference quotient or five-point stencil.

## Reference

- https://en.wikipedia.org/wiki/Difference_quotient

## Related File

- `diff_quotient.m`
