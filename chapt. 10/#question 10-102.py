#question 10-102
#Amir Arsalan Bayat
import math

#initials
p = 48e3 #N
e=0.02  #m
d = 0.05 #m
sigma_all_bend = 180e6 #pa


c= 0.025
A = math.pi * (c**2)
I = (math.pi/4)*(c**4)

r = math.sqrt(I/A)

#calculating the centeric stress

sigma_all_cent = (1/((A/p)*(1-((p*e*c)/(I*sigma_all_bend)))))*10e-7

#finally calculating the L

L = r*math.sqrt((382e3)/sigma_all_cent)

print(f"A: {A} ")
print(f"I: {I} ")
print(f"r: {r} ")
print(f"sigma all centeric: {sigma_all_cent} ")
print(f"Largest allowable effective length, L: {L} m")