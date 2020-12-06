# Reference: Page 21: https://www.dartmouth.edu/~cushman/courses/engs43/Chapter2.pdf

import numpy as np
import matplotlib.pyplot as plt
from array import *

delt=0.1;
delx=0.5;
D = 1.0;
N = 101;

alpha = D*delt / (delx*delx);

# Set the intial profile. 
# Define a concentration variable as a vector with 101 rows and 1 column.
c=np.zeros((N,1)); 
c = 1; # Value of the first element and rest are zeros.
plt.plot(c, 'k'); # Plot the initial profile.
plt.text(3, 0.3, 'Initial Profile', fontsize = 30, color ="black"); 

for k in range(1,10):
  for j in range(1,500):
    c=0;
    for i in range(2,100):            #First boundary condition
      c = c(i)*(1-2*alpha)+alpha*(c(i-1)+c(i+1));
      c.insert(101,c(i)*(1-2*alpha)+2*alpha*c(i-1)); #Second boundary condition
    plt.plot(c, 'g');
    plt.text(54, 0.6, 'Concentration', fontsize = 12, color ="black"); 
