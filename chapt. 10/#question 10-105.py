#question 10-105
#Amir Arsalan Bayat

import math
from re import T

p=93e3
le = 2.2
sigma_Y = 250
E = 200e9
e = 0.2
r0 = 0.4

t=0.03 
while t<0.16 :
    print("__________________________________")
    print("__________________________________")
    print (f"these are the conditions for t= {t}")

    ri = r0 - t
    A = math.pi * ((r0**2)-(ri**2)) 
    print (f"A is : {A}")
    I  = (math.pi/4) * ((r0**4)-(ri**4))
    r = math.sqrt(I/A)
    print (f"I and r are as follows:{I}, {r}")
    le_r = le/r *10 
    if le_r < 133.22 :
        print(f"le/r , {le_r} and is < 133.22 ")
        sigma_e = (((math.pi**2)*E)/((le_r)**2))/(10e5)
        sigma_all = (1/1.67)*(0.658**(sigma_Y/(sigma_e)))*(sigma_Y)
        
        cond = (p/A ) + ((p*e*r0)/I)
        
        if (cond/10000) <= sigma_all :
            print(f"allowable thickness is {t}")
            break
        else:
            t=t+0.03
            continue
    else:
        print(f"le/r was bigger than 133.22")
        t=t+0.03