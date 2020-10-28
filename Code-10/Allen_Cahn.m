% Allen-Cahn equation solved by the semi-implicit fourier
% spectral method.

%Semi-Implicit fourier spectral is given by
%\begin{equation}
%\begin{split}
%\tilde{\phi}^{t+\Delta t}-\tilde{\phi}^{t} & = -2 \kappa  k^{2}  L \tilde{\phi}^{t} {\Delta t} - L  \Delta t \tilde{g}^{t} \\

%\tilde{\phi}^{t+\Delta t} & = \frac{\tilde{\phi}^{t} - L\Delta t \tilde{g}^{t}}{1+2\kappa {k}^{2}L} 

%\end{split}

%\end{equation}

%\rmtext{where k^{2} = k_{x}^{2} + k_{y}^{2}}

%Parameters given in the semi-implicit spectral equation
kappa=1.0;
A=1.0;
L=1.0;
Nx=512;
Ny=512;

for i=1:Nx
    for j=1:Ny
        phi(i,j)=0.5+0.1*(0.5-rand());
    end
end
mesh(phi);
view(2);
pause(1)

dt=0.25;

half_Nx=Nx/2;
half_Ny=Ny/2;
delkx=2*pi/Nx;
delky=2*pi/Ny;

for m=1:10
    for n=1:10
        g=2.*A.*phi.*(1-phi).*(1-2*phi);
        ghat=fft2(g);
        phihat=fft2(phi);
        for i=1:Nx
            if((i-1)<half_Nx)
                kx=(i-1)*delkx;
            end
            if((i-1-Nx)>half_Nx)
                kx=(i-1-Nx)*delkx;
            end
            for j=1:Ny
                if((j-1)<=half_Ny)
                ky=(j-1)*delky;
                end
                if((j-1)>half_Ny)
                ky=(j-1-Ny)*delky;
                end
            end
            k2=kx.^2+ky.^2;
            %Time evolution
            phihat(i,j)=phihat(i,j)-L*dt*ghat(i,j)/(1+2*kappa*L*dt*k2);
        end
        phi=real(ifft2(phihat));
    end
    mesh(phi);
    view(2);
    pause(0);
end
       
% The final result shows two different regions or colors. They correspond 
% to domain 1 and domain 2.