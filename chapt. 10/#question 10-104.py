#question 10-104
#Amir Arsalan Bayat


import math
import sympy as sp
p = 128e3
le= 1.62
e = 0.018
E = 200e9
sigma_all_bend = 150e6


d = sp.Symbol("d")

A= 40e-3 * d
i_x = (1/12)*((40e-3)**3)*d

i_y = 1/12 * (A*(d**2))
X = d/2

r = math.sqrt(i_x/A)
print(f"r is: {r}")
le_r = le/r
print (f"le/r is: {le_r}")

sigma_cr= ((0.877)*(math.pi**2)*E)/((le_r)**2)

sigma_all_cent = (1/1.67) * sigma_cr


form= (d**2) - (60.756e-3 *d )- 2.304e-3

ans = sp.solve(form,d)

print (f"d is : {ans[1]*(10**3)} mm")
