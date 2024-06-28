#question 10-106
#Amirv Arsalan Bayat

import math


p=165000
le = 2.2
sigma_Y = 250
E = 200e9
e = 0.015
r0 = 0.04
sigma_all_bend = 150e6


t=0.003 
while t<0.016 :
    print("__________________________________")
    print("__________________________________")
    print (f"these are the conditions for t= {t}")

    ri = r0 - t
    A = (math.pi * ((r0**2)-(ri**2)))
    print (f"A is : {A}")
    I  = (math.pi/4) * ((r0**4)-(ri**4))
    r = math.sqrt(I/A)
    print (f"I and r are as follows:{I}, {r}")
    le_r = le/r 
    if le_r < 133.22 :
        print(f"le/r , {le_r} and is < 133.22 ")
        sigma_e = (((math.pi**2)*E)/((le_r)**2))/(10e5)
        sigma_all_centeric = (1/1.67)*(0.658**(sigma_Y/(sigma_e)))*(sigma_Y)
        
        
        cond =(((p/((A)*sigma_all_centeric) )/10**6) + ((p*e*r0)/((I)*sigma_all_bend)))

        if (cond) <1 :
            print(f"allowable thickness is {t}")
            break
        else:
            t=t+0.003
            continue
    else:
        print(f"le/r was bigger than 133.22")
        t=t+0.003