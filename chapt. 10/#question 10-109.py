#question 10-109
#Amir Arsalan Bayat
import sympy as sp

# Define constants
P = 32  # kips
e = 0.4  # in
L_e = 36  # in
sigma_all_b = 24  # ksi

# Define the variable
d = sp.symbols('d', real=True, positive=True)

# Cross-sectional area A
A = 2.25 * d

# Section modulus c
c = 0.5 * d

# Moment of inertia I_x
I_x = (1/12) * (2.25 * d**3)

# Radius of gyration r_x
r_x = d / sp.sqrt(12)

# Euler's critical load factor
L_e_r_min = sp.sqrt(12) * L_e / d

# Given that L_e/r_min > 55
sigma_all_c = 55400 / (L_e_r_min)**2

# Interaction equation
equation = (P / (A * sigma_all_c)) + ((P * e * c) / (I_x * sigma_all_b)) - 1

# Solve the equation
solution = sp.solve(equation, d)
valid_solution = [sol.evalf() for sol in solution if sol.evalf() < 2.25]

# Output the smallest valid solution
d_min = min(valid_solution)
print(f"min d is :{d_min}")