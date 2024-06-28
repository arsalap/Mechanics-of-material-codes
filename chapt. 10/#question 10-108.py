#question 10-108
#Amir Arsalan Bayat

import math

# Given data
sigma_C = 8.1  # MPa
E = 8300  # MPa
c = 0.8
L_e = 2.2  # m
K_CE = 0.300
P = 41  # kN
e = 40 * 10**-3  # m

# List of b values in meters
b_values = [0.090, 0.140, 0.190, 0.240]

def calculate_properties(b):
    d = b
    A = b * d
    I_x = (1/12) * b * d**3
    sigma_CE_sigma_C = (K_CE * E) / (((L_e/d)**2) * sigma_C)
    Cp = ((1+sigma_CE_sigma_C)/2*c) - (math.sqrt(((1+sigma_CE_sigma_C)/1.6)**2)  - math.sqrt (sigma_CE_sigma_C/0.8))
    sigma_all = sigma_C * Cp
    P_all = (680.02*b* Cp)   # convert to kN
    
    return d, sigma_CE_sigma_C, Cp, P_all

# Calculate properties for each b value
results = []
for b in b_values:
    d, sigma_CE_sigma_C, Cp, P_all = calculate_properties(b)
    results.append((b, d, sigma_CE_sigma_C, Cp, P_all))

# Find the minimum b value that can support the load P
for b, d, sigma_CE_sigma_C, Cp, P_all in results:
    
    if P_all >= P:
        selected_b = b
        
        break

# Print the results
print(f"b (m)    d (m)    sigma_CE/sigma_C    Cp      P_all (kN)")
for b, d, sigma_CE_sigma_C, Cp, P_all in results:
    print(f"{b:.3f}    {d:.3f}      {sigma_CE_sigma_C:.6f}        {Cp:.6f}   {P_all:.2f}")

print(f"\nSelected b: {selected_b} m")
