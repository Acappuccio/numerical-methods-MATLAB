# Five-Point Stencil

## Syntax

```matlab
[d, error_estimate] = FivePoint_Stencil(f, x, h)
```

## Description

Calculates the first derivative of a function at a given point using the five-point stencil method. This method uses function values around the target point to produce a more accurate numerical derivative than a basic difference quotient.

## Inputs

- `f` — Function handle to differentiate
- `x` — Point where the derivative is estimated
- `h` — Step size used for the stencil calculation

## Outputs

- `d` — Estimated first derivative at `x`
- `error_estimate` — Approximate error estimate based on the step size

## Example

```matlab
f = @(x) x.^2;
[d, error_estimate] = FivePoint_Stencil(f, 2, 0.1)
```

Expected derivative:

```matlab
d = 4.0000
```

## Theory

The five-point stencil estimates the derivative by evaluating the function at four points around `x`: `x - 2h`, `x - h`, `x + h`, and `x + 2h`.

The derivative is approximated using:

```matlab
f'(x) ≈ (-f(x+2h) + 8f(x+h) - 8f(x-h) + f(x-2h)) / (12h)
```

This reduces truncation error compared with simpler forward or central difference methods.

## Reference

- https://en.wikipedia.org/wiki/Five-point_stencil

## Related File

- `FivePoint_Stencil.m`
