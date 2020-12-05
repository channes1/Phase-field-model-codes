#The code implements a 1D diffusion equation that is solved using a periodic boundary condition (PBC).
import numpy as np
import matplotlib.pyplot as plt

delt = 0.01;
delx = 0.5;
D = 0.5;

alpha = D*delt/(delx**2);
N = 128; #For fourier transform or spectral method (2^N)

m = 2.0; # No. of wavelengths included in the domain

old_c=0;
new_c=0;
for i in range(1,N):
  old_c = 0.5*(1+sin(2*np.pi*m*i*delx/N)); # The composition will run from 0 to 1.
  new_c = 0; # This gets updates

plt.plot(old_c,'r*');
ax.text('\leftarrow Initial profile',xy=(56,0.8));
ax.text('\leftarrow Point of zero concentration',xy=(66,0.5));

for k in range(1,30):
  for j in range(1,500):
    for i in range(1,N):
      w=i-1; # West point
      e=i+1; # East point
      if(w==0):
        w=w+N;
        if(e==N+1):
          e=e-N;
          new_c=old_c(i)*(1-2*alpha)+alpha*(old_c(w)+old_c(e));
for i in range(1,N):
  old_c(i) = new_c(i);
  plt.plot(old_c, 'b');
