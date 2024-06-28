#question 7-47
#Amir Arsalan Bayat

import math

# Given values
V = 24    # lb
M = 144   # lb·in
T = 240   # lb·in

# Shaft cross section
d = 0.75    # in
c = d / 2   # in
J = (math.pi / 2) * c**4  # in^4
I = J / 2   # in^4

# Calculating stresses
tau = T * c / J   # Torsional stress (psi)
sigma = M * c / I # Bending stress (psi)

# Convert to ksi
tau_ksi = tau / 1000
sigma_ksi = sigma / 1000

# Transverse shear stress is zero at point H
tau_xy = tau_ksi
sigma_x = sigma_ksi
sigma_y = 0

# Average normal stress
sigma_ave = (sigma_x + sigma_y) / 2

# Radius of Mohr's circle
R = math.sqrt(((sigma_x - sigma_y) / 2)**2 + tau_xy**2)

# Principal stresses
sigma_a = sigma_ave + R
sigma_b = sigma_ave - R

# Maximum shearing stress
tau_max = R

# Output results
print(f"Torsional stress, τ = {tau_ksi:.3f} ksi")
print(f"Bending stress, σ = {sigma_ksi:.3f} ksi")
print(f"σ_x = {sigma_x:.3f} ksi")
print(f"σ_y = {sigma_y:.3f} ksi")
print(f"Average normal stress, σ_ave = {sigma_ave:.3f} ksi")
print(f"Radius of Mohr's circle, R = {R:.3f} ksi")
print(f"Principal stress, σ_a = {sigma_a:.3f} ksi")
print(f"Principal stress, σ_b = {sigma_b:.3f} ksi")
print(f"Maximum shearing stress, τ_max = {tau_max:.3f} ksi")