#question 7-27
#Amir Arsalan Bayat=
from cmath import sqrt
import math

# Given values
sigma_x = 60  # MPa
tau_xy = 20   # MPa
R = 75        # MPa (maximum in-plane shearing stress)

# Calculation
# u = (sigma_x - sigma_y) / 2
# R^2 = u^2 + tau_xy^2
# u = sqrt(R^2 - tau_xy^2)

u = math.sqrt(R**2 - tau_xy**2)
sigma_y1 = sigma_x - 2*u
sigma_y2 = sigma_x + 2*u

# Output the largest value of sigma_y
sigma_y_max = max(sigma_y1, sigma_y2)

print(f"The largest value of σ_y is {sigma_y_max} MPa")