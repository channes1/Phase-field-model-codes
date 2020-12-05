# Solution to 1D Diffusion equation using Implicit technique.

import numpy as np
import matplotlib.pyplot as plt

M=1;
N=32;
dx=1.0;

c = np.zeros((1,N)); 
for i in range(1,N):
  c=0.5*(1+np.sin(2*np.pi*M*i*dx/N));
  plt.plot(c, 'r');

half_N=N/2;
#Fourier space discretization
delk=2*np.pi/N;
#Time step
dt=0.5;

for m in range(1,80):
  c_hat=np.fft.fft(c);

#PBC half N to include k=0 point in the fourier space
for i in range(1,N):
  if((i-1)<=half_N):
    k=(i-1)*delk;
    if((i-1)>half_N):
      k=(i-1-N)*delk;
      k_e=k**2;
      c_hat=c_hat(i)/(1+k_e*dt);

c=real(np.fft.ifft(c_hat));
plt.plot(c, 'b');
