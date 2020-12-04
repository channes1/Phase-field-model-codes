% Solution to 1D Diffusion equation using Implicit technique.

M=1;
N=32;
dx=1.0;

c = zeros(1,N); 
for i=1:N
    c(i)=0.5*(1+sin(2*pi*M*i*dx/N));
end

plot(c, 'r', 'LineWidth', 2);
hold on

half_N=N/2;
%Fourier space discretization
delk=2*pi/N;
%Time step
dt=0.5;

for m=1:80
    c_hat=fft(c);
end

for i=1:N
    %PBC half N to include k=0 point in the fourier space
    if((i-1)<=half_N)
        k=(i-1)*delk;
    end
    if((i-1)>half_N)
        k=(i-1-N)*delk;
    end
    k_e=k^2;
    c_hat(i)=c_hat(i)/(1+k_e*dt);
end
c=real(ifft(c_hat));
%end
plot(c, 'b', 'LineWidth', 2);
