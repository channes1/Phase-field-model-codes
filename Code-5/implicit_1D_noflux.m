% The code implements a diffusion equation with no flux and boundary condition. 
% with an implicit scheme. 
% Refer: http://www.atmos.albany.edu/facstaff/brose/classes/ATM623_Spring2015/Notes/Lectures/Lecture16%20--%20Numerical%20methods%20for%20diffusion%20models.html

%
delt = 0.1;
delx=0.5;

D= 1.0; %Diffusivity
N= 101;

alpha=D*delt/(delx^2);

c=zeros(N,1);
c(1)=1.0;
for j = 1:N
    c_old(j,1) = c(j,1);%To keep a distinction between values from old time and new time. 
                        % Due to the use of implicit scheme.
                        %c_old=c^t 
end
plot(c,'b*', 'LineWidth', 1.5); % c = c^(t+\Delta t)
text(10,0.05,'\downarrow Initial profile', 'FontSize',12);
hold on 

A = zeros(N,N);

A(1,1) = 1.0; % For first boundary condition.
%Populate the diagonal elements of A matrix.
for j = 2:N
    A(j,j)=1+2*alpha;
end

for j=2:N-1
    A(j,j-1)= -alpha; % Populate the lower diagonal elements
end

for j= 3:N
    A(j-1,j)=-alpha; % Populate the Upper diagonal elements.
end

for k=1:10
    for j=1:500
        c=A\c_old;
        for i=1:N %Loop for i
            c_old(i)=c(i);%To store the new value of c in old c.
        end
    end
    plot(c, 'g', 'LineWidth', 1.5);
    text(67,0.3,'\leftarrow Concentration', 'FontSize',12);
end