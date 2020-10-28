%% \textrm{Free energy functional, G}
% \frac{G}{{N}_{v}} = \Big\int = {f}_{0}(c) + \kappa|\nabla C|^2 dv
% \textrm{where} ${f}_{0}(c) = A{c}^{2}{(1-c)}^{2}$
% \textrm{where c is a conserved order parameter}

%% \textrm{The evolution equation is given by}
% 
% $$\frac{\delta c}{\delta t} = M (\nabla C)^2 \Bigg( \frac{\delta
% \frac{G}{{N}_{v}} }{\delta c} \Bigg)$$
%                             = M (\nabla C)^2 \Bigg[\frac{\diffp
%                             {f}_{0}}{\diffp {C}} - 2\kappa{\nabla}^{2} C \Bigg]
% \frac{\diffp C}{\diffp t} = M {\nabla}^{2} g(c) - 2\kappa M{\nabla}^{4} C
% where \Big( \frac{\delta \frac{G}{{N}_{v}} }{\delta c} \Big) = \mu
% 

% Finally 
%\frac{{\tilde{c}}^{t} - M \times ({k}_{x}^{2}+{k}_{y}^{2}) \times \Delta t\times \tilde{g}}{1 + 2\kappa M {({k}_{x}^{2}+{k}_{y}^{2})}^{2} \times \Delta t} 
%
%%
Nx=32;
Ny=32;
%Introduce noise
more off
for i=1:Nx
    for j=1:Ny
        c(i,j)=0.5+0.1*(0.5-rand()); 
        %rand() will give a value between 0 and 1.
    end
end

mesh(c); 
% To generate a 3D plot. The z-axis is for the noise, i.e., about 0.5.
view(2)
pause(0) % A brief pause and then introduce new figure
dt=0.5; % Time descretization
halfNx=Nx/2; %To implement the periodic boundary conditions (PBC)
halfNy=Ny/2;
delkx=2*pi/Nx;
delky=2*pi/Ny;

A=1.0;
M=1.0;
kappa=1.0;

for m=1:10
for n=1:7 %Time loop: For every 7 time steps the inner loop will plot. 
          %The complete operation will be repeated 70 times
g=2.*A.*c.*(1-c).*(1-2*c);
%fft(2): 2D Fourier Transform
ghat=fft2(g);
chat=fft2(c);
 for i=1:Nx
     if((i-1)<halfNx)
      kx=(i-1)*delkx;
     end
      if((i-1)>halfNx)
         kx=(i-1-Nx)*delkx;
         end
 end   
 %Implementation of the PBCs
  for j=1:Ny
            if((j-1)<halfNy)
                ky=(j-1)*delky;
            end
            if((j-1)>halfNy)
                ky=(j-1-Ny)*delky;
            end
   end   
            ke=kx^2+ky^2;
            kf=ke^2;
  %To evolve the system and observe coarsening. After some time there will
  %be phase separation.
            chat(i,j)=(chat(i,j)-dt*ke*M*ghat(i,j))/(1+2*M*kappa*kf*dt);
  %Real space
            c=real(ifft2(chat));
   end
    mesh(c);
    view(2);
    pause(0);
end