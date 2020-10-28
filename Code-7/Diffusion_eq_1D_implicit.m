%Solution to solve a 1D diffusion equation using implicit spectral method

%Define system size and parameters
N = 128;
D=1; %Diffusivity
delt=1.0;

c=zeros(N,1); %Define a column vector

M = 2;
for j=1:N
    c(j,1) = 0.5*(1+sin(2*pi*M*j/N));
end
plot(c,'rs');

hold on

%Periodic boundary conditions
%Half length of the simulation box
half_N = N/2;
%Define grid space in reciprocal space
delk = 2*pi/N;
for l = 1:20% 
    for m = 1:500 % For composition evolution 
        ctilde = fft(c);
        for i = 1:N
            if(i<half_N)
                k=i*delk;
            end
            if (i>=half_N)
                k = (i-1)^delk;
            end
            %Time evolution
            ctilde(i,1) = ctilde(i,1)/(1+D*k^2*delt);
        end
    end
    c=real(ifft(ctilde));
    plot(c, 'b');
end