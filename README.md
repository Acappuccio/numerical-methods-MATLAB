# Numerical Differentiation Methods — MATLAB

A MATLAB toolkit implementing and comparing four numerical differentiation algorithms. Built to analyze how computers approximate derivatives — the foundation of signal processing, control systems, and biomedical data analysis.

---

## What It Does

Given any function f(x), these four algorithms estimate its derivative numerically — no symbolic calculus required. The toolkit compares their accuracy, visualizes the results, and lets you input any function interactively.

---

## The Four Methods

| Method | Formula | Error Order |
|---|---|---|
| Difference Quotient | [f(x+h) - f(x)] / h | O(h) — least accurate |
| Symmetric Diff Quotient | [f(x+h) - f(x-h)] / 2h | O(h²) |
| Five-Point Stencil | Weighted 5-point average | O(h⁴) — most accurate |
| Nth Derivative | Generalized finite difference | O(h^n) — any order |

The key insight: smaller error order means accuracy improves faster as step size decreases. Five-Point Stencil is 10,000x more accurate than Difference Quotient at small h.

---

## Two Interactive Demos

### demo_compare_derivatives
You input any function and derivative order. The demo runs all four methods and produces:
- Top plot: original function with all four derivative approximations overlaid
- Bottom plot: absolute error of each method vs the true derivative
- Console summary: max and average error per method

Run it:
demo_compare_derivatives

Try: f(x) = sin(x), order = 1, true derivative = cos(x)
The error plot clearly shows Difference Quotient is 50x less accurate than the others.

---

### demo_tangentline
You input any function and step size. Produces a 2x2 grid — one subplot per method — each showing the original function, derivative approximation, tangent line at the starting point, and intersection points.

Run it:
demo_tangentline

---

## How to Use Individual Functions

diff_quotient(@(x) sin(x), 1.0, 0.1) — first derivative of sin(x) at x=1
FivePoint_Stencil(@(x) sin(x), 1.0, 0.1) — same, higher accuracy
SymDiff_quotient(@(x) sin(x), 1.0, 0.1) — same, centered method
nth_derivative(@(x) sin(x), 1.0, 0.1, 2) — second derivative of sin(x) at x=1

Each function returns the derivative value and an error estimate.

---

## Files

| File | Description |
|---|---|
| demo_compare_derivatives.m | Main interactive accuracy comparison demo |
| demo_tangentline.m | Interactive tangent line visualization demo |
| diff_quotient.m | Forward difference quotient implementation |
| FivePoint_Stencil.m | Five-point stencil implementation |
| SymDiff_quotient.m | Symmetric difference quotient implementation |
| nth_derivative.m | Generalized nth order derivative |
| graph_illustrate_differentiation.m | Plots all four methods on one figure |
| graph_tangentline.m | Tangent line visualization per method |
| tests_*.m | Automated unit tests for each function |
| *.md | Documentation file for each function |

---

## Requirements
MATLAB R2019b or later.
