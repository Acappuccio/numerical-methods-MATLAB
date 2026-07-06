# Derivative Comparison Demo

## Syntax

```matlab
demo_compare_derivatives()
```

## Description

Interactive MATLAB demo that compares multiple numerical differentiation methods on a user-defined function. The script plots the function, derivative approximations, and absolute error for each method.

## Methods Compared

- Forward difference quotient
- Five-point stencil
- Symmetric difference quotient
- nth-derivative approximation

## Features

- Accepts a user-entered function of `x`
- Supports first, second, or higher derivative order input
- Allows optional true derivative input for error comparison
- Uses five-point stencil as the reference if no true derivative is provided
- Plots derivative approximations and absolute error
- Prints maximum and average error for each method

## Example Run

```matlab
demo_compare_derivatives()
```

Example input:

```matlab
f(x) = sin(x)
Derivative order (1=first, 2=second, etc): 1
Do you know the true derivative? (y/n): y
True derivative = cos(x)
```

## Output

The script creates a figure with two plots:

1. Function and derivative approximations  
2. Absolute error compared with either the true derivative or the five-point stencil reference

It also prints an accuracy summary in the Command Window.

## Related File

- `demo_compare_derivatives.m`
