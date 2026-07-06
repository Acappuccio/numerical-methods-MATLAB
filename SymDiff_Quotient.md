# Symmetric Difference Quotient

## Syntax

```matlab
[d, error_estimate] = SymDiff_quotient(f, x, h)
```

## Description

Calculates the first derivative of a function at a given point using the symmetric difference quotient. This method estimates the slope by comparing function values on both sides of the target point.

## Inputs

- `f` — Function handle to differentiate
- `x` — Point where the derivative is estimated
- `h` — Step size used on both sides of `x`

## Outputs

- `d` — Estimated first derivative at `x`
- `error_estimate` — Approximate error estimate based on the step size

## Example

```matlab
f = @(x) (3*x.^4) - (4*x.^3) - (x.^2) + 12;
[d, error_estimate] = SymDiff_quotient(f, 2, 0.1)
```

Expected derivative:

```matlab
d = 85.9360
```

## Theory

The symmetric difference quotient estimates the derivative by evaluating the function at two points around `x`: `x - h` and `x + h`.

The derivative is approximated using:

```matlab
f'(x) ≈ (f(x+h) - f(x-h)) / (2h)
```

This method averages the forward and backward change around the point, usually giving a better approximation than a one-sided difference quotient.

## Reference

- https://en.wikipedia.org/wiki/Symmetric_derivative

## Related File

- `SymDiff_quotient.m`
