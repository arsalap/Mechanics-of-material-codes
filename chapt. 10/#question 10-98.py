#question 10-98
#Amir Arsalan Byat

import math

# Given data
P = 18  # kips
sigma_allow_bending = 22  # ksi
sigma_y = 36  # ksi
E = 29000  # psi

# Properties of one angle
A_single = 2.48  # in^2
I_x_single = 3.94  # in^4
S_x_single = 1.44  # in^3
r_x_single = 1.26  # in
y_single = 1.27  # in
I_y_single = 1.89  # in^4
r_y_single = 0.873  # in
e_single = 0.775  # in

# Properties of two angles
A = 2 * A_single
I_x = 2 * I_x_single
r_min = math.sqrt(I_x / A)
y = 1.27  # in
I_y = 2 * (I_y_single + A_single * e_single**2)
r_y = math.sqrt(I_y / A)

e = y - 3 / 16
e = y - 3 / 16
I_min = I_y
r_min = math.sqrt(I_min / A)

# P/A ratio
P_over_A = P / A

# Effective slenderness ratio
sigma_all_c = 4.2333
L_r = 133.7

# Calculate length L
L_r = math.sqrt((0.877 * math.pi**2 * E) / (1.67 * sigma_all_c))
L = L_r * r_min

# Results
print(f"Area of two angles, A: {A:.2f} in^2")
print(f"Moment of inertia about x-axis, I_x: {I_x:.2f} in^4")
print(f"Effective slenderness ratio, L/r: {L_r:.2f}")
print(f"Length, L: {L:.2f} in")
print(f"Length, L: {L / 12:.2f} ft")