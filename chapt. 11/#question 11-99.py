#question 11-99
#Amir Arsalan Bayat

import sympy as sp

# Define the variables
Q, P, L, A, E = sp.symbols('Q P L A E')

# Define the forces from the solution
F_AC = sp.Rational(5, 2) * P / 4
F_CD = -P / 2
F_BD = -P + sp.Rational(2, 2) * Q

# Strain energy components
dU_dQ = (1 / (2 * E * A)) * ((F_AC * 2 * L / 4) + (F_CD * 2 * L / 4) + (F_BD ** 2 * L) )
dU_dP = (1 / (2 * E * A)) * ((F_AC * 2 * L / 4) + (F_CD * 2 * L / 4) + (F_BD ** 2 * L) )

# Calculate the deflections
x_C = sp.diff(dU_dQ, Q).subs(Q, 0)
y_C = sp.diff(dU_dP, P).subs(Q, 0)

# Display the results
print(f'x_C: {x_C}')
print(f'y_C: {y_C}')