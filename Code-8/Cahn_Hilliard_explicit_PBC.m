% Solution for Cahn-Hilliard equation by applying finite difference 
% explicit method and periodic boundary conditions.

dt= 0.001;
dx= 1.0;
D=1.0; % Diffusivity
kappa=1.0;

beta_a =dt/(dx.^2);
beta_b = 2*kappa*dt/(dx.^4);

n=32; %System size 
N=40000; %Number of time steps to run the simulation

hold on
m=1; % Wavelength
for i=1:n
    old_c(i)=0.5*(1+sin(2*pi*m*i*dx/n)); %Gives a sinusoidal profile
    new_c(i)=0.0; 
end

plot(old_c,'LineWidth',2);
text(18, 0.3087,'\leftarrow Initial profile', 'LineWidth', 1);
A=1.0; %To calculate nonlinear part

for i=1:n
    %Non-linear part: g(c) = c*(1-c)*(1-2*c)
    g(i)=2*A*old_c(i)*(1-old_c(i))*(1-2*old_c(i));
end
for j=1:N %time stepping loop
    for i=1:n %Start loop over nodal points to calculate the new composition
        w=i-1;
        ww=i-2;
        e=i+1;
        ee=i+2;
        if(ww<1)
            ww=ww+n;
        end
        if(ee>n)
            ee=ee-n;
        end
        if(w<1)
            w=w+n;
        end
        if(e>n)
            e=e-n;
        end
        % Time evolution according to the finite difference method
        new_c(i)=old_c(i)+beta_a*(g(w)-2*g(i)+g(e))-beta_b*(old_c(ww)-4*old_c(w)+6*old_c(i)-4*old_c(e)+old_c(ee));
    end

%Update the profile
for i=1:n
    old_c(i)=new_c(i);
end 
%End of time loop
end
%Plot final profile
plot(old_c,'r','LineWidth',2);
text(15, 0.725,'\leftarrow Final profile', 'LineWidth', 1);