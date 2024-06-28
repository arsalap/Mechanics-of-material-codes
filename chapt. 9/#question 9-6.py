#question 9-6
#Amir Arsalan Bayat
import sympy as sp

# Define variables
x, L, E, I, w = sp.symbols('x L E I w')

# Given moment equations for elastic curve over AB
EI_d2y_dx2 = (-w * x**3 / 6) + (w * L * x**2 / 2) - (w * L**2 * x / 2)

# Integrate to find dy/dx
EI_dy_dx = sp.integrate(EI_d2y_dx2, x) + sp.symbols('C1')
# Set integration constant C1 to 0 (since dy/dx at x=0 is 0)
EI_dy_dx = EI_dy_dx.subs(sp.symbols('C1'), 0)

# Integrate to find y
EI_y = sp.integrate(EI_dy_dx, x) + sp.symbols('C2')
# Set integration constant C2 to 0 (since y at x=0 is 0)
EI_y = EI_y.subs(sp.symbols('C2'), 0)

# Simplify the elastic curve equation
y = (w / (24 * E * I)) * (-x**4 + 4 * L * x**3 - 4 * L**2 * x**2)

# Evaluate y at x = L
y_B = y.subs(x, L)

# Evaluate dy/dx at x = L
dy_dx_B = EI_dy_dx.subs(x, 0) / (E * I)

# Output results
print(f"Elastic curve equation over AB: y = {y}")
print(f"Deflection at B (y_B): y_B = {y_B}")
print(f"Slope at B (dy/dx at B): dy/dx_B = {dy_dx_B}")