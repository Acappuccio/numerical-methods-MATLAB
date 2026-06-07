# Five-Point Stencil 
## Syntax 
  ` function [d] = FivePoint_Stencil (f, x, h);`
## Description 
  * Will take the function `f` at a certian point `x` with the change in x `h`...
    and will calculate the first derivative using the five point stencil formula...
    by taking the weighted average of slopes for 2 secant lines. 
## Example 
    >> f= @(x) x.^2;
    >> FivePoint_Stencil (@(x) x.^2, 2, .1);
    >> ans= 4.0000
## Theory 
   * The Five-Point Stencil will first calculate the slope of the  secant line from points
    (x-2h) to (x+h), followed by the slope of seperate secant     line from points x-h to x+h to...
    approximate the weighted average value of x (slope of the tangent line).

<https://en.wikipedia.org/wiki/Five-point_stencil>
