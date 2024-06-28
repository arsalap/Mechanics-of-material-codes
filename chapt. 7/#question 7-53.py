#question 7-53
#Amir Arsalan Bayat

import math

# Given values
sigma_x = 12  # MPa
sigma_y = 2   # MPa
theta = 60    # degrees

# Average normal stress
sigma_ave = (sigma_x + sigma_y) / 2

# Stress difference divided by 2
u = (sigma_x - sigma_y) / 2

# Angle in radians
theta_rad = math.radians(theta)

# Radius of Mohr's circle
R = u / math.cos(theta_rad)

# In-plane shearing stress parallel to the weld is zero, so we solve for tau_xy
tau_xy = -u * math.tan(theta_rad)

# Principal stresses
sigma_a = sigma_ave + R
sigma_b = sigma_ave - R

# Output results
print(f"Radius of Mohr's circle, R = {R:.2f} MPa")
print(f"In-plane shearing stress, τ_xy = {tau_xy:.2f} MPa")
print(f"Principal stress, σ_a = {sigma_a:.2f} MPa")
print(f"Principal stress, σ_b = {sigma_b:.2f} MPa")