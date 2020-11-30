#  Non dimensional formula for the regular solution model
# \Delta G/RT = \omega *x(1-x)/RT + [x*ln(x)+(1-x)*ln(1-x)]

# Non dimensionalizing of \Delta G/RT as dg
# dg = \Delta G/RT 

# Non dimensionalizing \omega/RT as \alpha 
# dg = alpha*x(1-x)+ds
# \alpha=omega/RT [Non dimensional scaled regular solution parameter]
# ds = x*ln(x)+(1-x)*ln(1-x) [Non dimensional entropy of mixing]

import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0.001,0.999,0.001);
ds = x*np.log(x)+(1-x)*np.log(1-x); 

alpha_a=0.1; 
dg_a=alpha_a*x*(1-x);

alpha_b = 1.5;
dg_b=alpha_b*x*(1-x);

alpha_c = 2.5;
dg_c=alpha_c*x*(1-x);
#alpha_d = 5.5;
#dg_d=alpha_d*x*(1-x);

plt.plot(x,dg_a,x,ds,x,dg_a+ds);
plt.plot(x,dg_b,x,ds,x,dg_b+ds);
plt.plot(x,dg_c,x,ds,x,dg_c+ds);
#plt.plot(x,dg_d,x,ds,x,dg_d+ds);

