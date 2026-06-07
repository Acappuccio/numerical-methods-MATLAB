# Difference Quotient 
 ## Syntax 
  `function[d]=diff_quotient (f,x,h);`
# Description
* Find the difference quotient of a given function `f` at a specific point `x`...
  with a givin step size (change in x) `h`. 
## Examples 
    >> f= @(x) x.^2;
    >> diff_quotient(@(x) x.^2,2,0.1)
    >> ans = 4.1 
## Theory 
 * The diff_quotient function `(f(x+h)-f(x))/h` will calculate the first derivative and set f to the...
   derivative value. It will then substitute in the specific point `x` with step size `h`...
   into the difference quotient equation `d` and output the approximation of the derivative. 
   
 <https://en.wikipedia.org/wiki/Difference_quotient>
 
