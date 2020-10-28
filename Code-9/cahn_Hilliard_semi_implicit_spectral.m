%Solution for Cahn-Hilliard equation using semi-implicit spectral technique

N=32;
dx=1.0;
M=1.0;

for i=1:N
    c(i)=0.5*(1+sin(2*pi*M*i*dx/N));
end

plot(c,'r');
hold on

half_N=N/2;
delk=2*pi/N;
dt=0.5;

for m=1:900000
    g=2.*c.*(1-c).*(1-2.*c);
    ghat=fft(g);
    chat=fft(c);
    for i=1:N
        if((i-1)<=half_N)
            k=(i-1)*delk;
        end
if((i-1)>half_N)
    k=(i-1-N)*delk;
end
k_e=k^2;
k_f=k^4;
%Equation for time evolution
chat(i)=(chat(i)-dt.*k_e.*ghat(i))/(1+2.*k_f.*dt);
end
c=real(ifft(chat));
end
plot(c);