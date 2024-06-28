#question 11_98
#Amir Arsalan Bayat

import sympy as sp

# Define the variables
M_A, x, E, I = sp.symbols('M_A x E I')

# Constants
E_value = 200 * 10**9  # GPa to Pa
I_value = 57.5 * 10**-6  # in^4 to m^4 (assuming consistent units)

# Reactions at A and B
R_A = -4 + M_A / 6
R_B = 12 - M_A / 6

# Moment expressions over AD and DB
M_AD = -M_A + R_A * x - 4 * x + M_A * x / 6
M_DB = -8 * (x - 6)

# Strain energy over AD
U_AD = sp.integrate((M_AD**2) / (2 * E * I), (x, 0, 6))

# Strain energy over DB
U_DB = sp.integrate((M_DB**2) / (2 * E * I), (x, 6, 9))

# Total strain energy
U = U_AD + U_DB

# Slope at A (theta_A)
theta_A = sp.diff(U, M_A).subs(M_A, 0)

# Substitute numerical values
theta_A_value = theta_A.subs({E: E_value, I: I_value})

# Display the result
print(f'Theta_A: {theta_A_value.evalf()} rad')