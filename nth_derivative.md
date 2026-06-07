# _n_ th derivative Difference Quotient 
  ## Syntax 
   `function[d]=nth_derivative(f,x,h,n);`
  ## Description 
   Find the specified derivative `n` of a function `f` at a
   given point `x` with a given change in x `h`. 
  ## Example 
    >> f = @(x) 2*x.^10;
    >> nth_derivative th_derivative(f,1,0.1,10);
    >> ans = 4.6619e+04
  ## Theory 
   The nth_derivative function will find the first few derivatives...
      given a specified `n` amount at a given point `x` within a function...
      `f` and change in x `h`. Then each successive derivative is found...
      to arrive at the specified _n_ th derivative `d`. 
      
 <https://en.wikibooks.org/wiki/Calculus/Higher_Order_Derivatives>
   
