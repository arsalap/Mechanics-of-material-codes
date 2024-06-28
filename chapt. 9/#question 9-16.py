#question 9-16
#Amir Arsalan Bayat

# Constants
I = 23.9e-6  # Moment of inertia in m^4
E = 200e9    # Modulus of elasticity in Pa
P = 17.5e3   # Load in N
L = 2.5      # Length of the beam in m
a = 0.8      # Distance in m

# Elastic curve equation (portion BD)
def elastic_curve(x):
    y = (P / (E * I)) * (0.5 * a * x**2 - 0.5 * a * L * x + (a**3 / 6))
    return y

# Deflection at the center C (x = L / 2)
x_c = L / 2
y_c = (P * a / (E * I)) * (L**2 / 8 - a**2 / 6)

# Results
elastic_curve_center = elastic_curve(x_c)
deflection_center = y_c

print(f"Elastic curve at center (x = {x_c} m): {elastic_curve_center:.4e} m")
print(f"Deflection at center C: {deflection_center:.4e} m")