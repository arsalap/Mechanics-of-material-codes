#question 10-103
#Amir Arsalan Bayat

import math
import sympy as sp
p = 198e3
le= 0.72
e = 0.018
E = 200e9
sigma_all_bend = 150e6
sigma_Y = 250

d = sp.Symbol("d")

A= 40e-3 * d
i_x = (1/12)*((40e-3)**3)*d

i_y = 1/12 * (A*(d**2))
X = d/2

r = math.sqrt(i_x/A)
print(f"r is: {r}")
le_r = le/r
print (f"le/r is: {le_r}")

sigma_e= ((math.pi**2)*E)/((le_r)**2)

sigma_all_cent = (1/1.67) * ((0.658)**(sigma_Y/(sigma_e/(10**6)))) * (sigma_Y)


form= (d**2) - (40.634e-3 *d )- 3.564e-3

ans = sp.solve(form,d)

print (f"d is : {ans[1]*(10**3)} mm")
