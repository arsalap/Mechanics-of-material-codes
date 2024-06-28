#question 7-37
#Amir Arsalan Bayat

import math

# Given values
sigma_x = 8   # ksi
sigma_y = -12 # ksi
tau_xy = -6   # ksi

# Calculating average stress
sigma_ave = (sigma_x + sigma_y) / 2

# Calculating radius of Mohr's circle
R = math.sqrt(((sigma_x - sigma_y) / 2)**2 + tau_xy**2)

# Function to calculate stresses after rotation
def stresses_after_rotation(theta_deg):
    

    two_theta = 2 * theta_deg
    
    if two_theta >= 30:
        sigma_x_prime = sigma_ave + R * math.cos(math.radians(two_theta-30.96))
        sigma_y_prime = sigma_ave - R * math.cos(math.radians(two_theta-30.96))
        tau_xy_prime = -R * math.sin(math.radians(two_theta-30.96))
        
        return sigma_x_prime, sigma_y_prime, -tau_xy_prime
    elif two_theta < 30 :
        sigma_x_prime = sigma_ave + R * math.cos(math.radians(two_theta+30.96))
        sigma_y_prime = sigma_ave - R * math.cos(math.radians(two_theta+30.96))
        tau_xy_prime = -R * math.sin(math.radians(two_theta+30.96))
        
        return sigma_x_prime, sigma_y_prime, tau_xy_prime


# Rotation angles
theta_25_cw = 25   # clockwise
theta_10_ccw = 10 # counterclockwise

# Calculating stresses for 25 degrees clockwise rotation
sigma_x_prime_25, sigma_y_prime_25, tau_xy_prime_25 = stresses_after_rotation(theta_25_cw)

# Calculating stresses for 10 degrees counterclockwise rotation
sigma_x_prime_10, sigma_y_prime_10, tau_xy_prime_10 = stresses_after_rotation(theta_10_ccw)

# Output results
print(f"Stresses after 25° clockwise rotation:")
print(f"σ_x' = {sigma_x_prime_25:.2f} ksi")
print(f"σ_y' = {sigma_y_prime_25:.2f} ksi")
print(f"τ_xy' = {tau_xy_prime_25:.2f} ksi")

print(f"\nStresses after 10° counterclockwise rotation:")
print(f"σ_x' = {sigma_x_prime_10:.2f} ksi")
print(f"σ_y' = {sigma_y_prime_10:.2f} ksi")
print(f"τ_xy' = {tau_xy_prime_10:.2f} ksi")