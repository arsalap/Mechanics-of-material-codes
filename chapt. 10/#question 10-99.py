#question 10-99
#Amir Arsalan Bayat

import math

# Given data
E = 11100  # MPa
d = 0.18  # meters
b = 0.24  # meters
P = 85e3  # N
sigma_C = 8.3  # MPa

# Calculations
A = b * d  # Cross-sectional area
I_x = (1/12) * d * (b**3)  # Moment of inertia about x-axis
e = 25e-3  # meters
c = b / 2  # meters

# Calculate sigma_all
sigma_all = P / A + ((P * e * c )/ I_x)
sigma_all /= 1e6  # Convert to MPa

# Coefficients for sawn lumber
c_sawn = 0.8
K_CE = 0.300

# Define y and x as
C_p = sigma_all / sigma_C
y = C_p
x = y*((1-c_sawn*y)/(1-y))


# Calculate sigma_CE
sigma_CE = sigma_C * (x)

# Largest allowable effective length L
L = d * math.sqrt(K_CE * E / sigma_CE)

# Results
print(f"Cross-sectional area, A: {A:.6f} m^2")
print(f"Moment of inertia about x-axis, I_x: {I_x:.12f} m^4")
print(f"Adjusted allowable stress, sigma_all: {sigma_all:.6f} MPa")
print(f"Coefficient C_p: {C_p:.6f}")
print(f"Coefficient x: {x:.6f}")
print(f"Adjusted compressive stress, sigma_CE: {sigma_CE:.6f} MPa")
print(f"Largest allowable effective length, L: {L:.2f} m")