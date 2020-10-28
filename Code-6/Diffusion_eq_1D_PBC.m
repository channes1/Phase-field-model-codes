%The code implements a 1D diffusion equation that is solved using a periodic boundary condition (PBC).

delt = 0.01;
delx = 0.5;
D = 0.5;

alpha = D*delt/(delx^2);
N = 128;%For fourier transform or spectral method (2^N)

m = 2.0; % No. of wavelengths included in the domain

for i = 1: N
    old_c(i)= 0.5*(1+sin(2*pi*m*i*delx/N)); % The composition will run from 0 to 1.
    new_c(i)= 0; % This gets updates
end

plot(old_c,'r*', 'LineWidth',5);
text(56,0.8,'\leftarrow Initial profile', 'FontSize',12);
text(66,0.5,'\leftarrow Point of zero concentration', 'FontSize',12);

hold on

for k = 1:30
    for j=1:500
       for i=1:N

        w=i-1; % West point
        e=i+1; % East point
        
%Implement of periodic boundary conditions
if (w==0)
    w=w+N;
end
if (e==N+1)
    e=e-N;
end
new_c(i)=old_c(i)*(1-2*alpha)+alpha*(old_c(w)+old_c(e));
    end
    %Evolution of the composition profile
    for i=1:N
        old_c(i)=new_c(i);
    end
plot(old_c, 'b', 'LineWidth',1);

    end
end