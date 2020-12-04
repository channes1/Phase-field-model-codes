#Solution for Cahn-Hilliard equation using semi-implicit spectral technique

import numpy as np
import matplotlib.pyplot as plt
from scipy.fft import fft, ifft

N=32;
dx=1.0;
M=1.0;
half_N=N/2;
delk=2*np.pi/N;
dt=0.5;

c = 0;
for i in range(1,N):
  c = 0.5*(1+np.sin(2*np.pi*M*i*dx/N));
  plt.plot(c,'g-')
 #print(c)

for m in range(1,900000):
  g=2*c*(1-c)*(1-2*c);
  chat=np.fft.fft(c);
  ghat=np.fft.fft(g);


for i in range(1,N):
  if((i-1)<=half_N):
    k=(i-1)*delk;
    if((i-1)>half_N):
      k=(i-1-N)*delk;
      k_e=k**2;
      k_f=k**4;
      chat=(chat(i)-dt*k_e*ghat(i))/(1+2*k_f*dt);
      c=np.real(fft.ifft(chat));

plt.plot(c,'k-')
