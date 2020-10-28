% Reference: Page 21: https://www.dartmouth.edu/~cushman/courses/engs43/Chapter2.pdf

delt=0.1;
delx=0.5;
D = 1.0;
N = 101;

alpha = D*delt / (delx*delx);

% Set the intial profile. 
% Define a concentration variable as a vector with 101 rows and 1 column.
c=zeros(N,1); 
c(1) = 1.0; % Value of the first element and rest are zeros.
plot(c, 'k--','LineWidth',1.5); % Plot the initial profile.
text(3, 0.3,'\leftarrow Initial Profile', 'FontSize',12);
hold on

%Introduces three different loops
for k= 1:10 % To plot 10 figures 
    for j = 1:500 % Plot is made once in every 500 steps, i.e., ... 
                  % \Delta t*500 = 50 time units
    for i = 2:100 % At Point i = 2; Begin the loop
                  % .
                  % .
                  % .
                  % Point i = 101; At this point the evolution will
                  % occur...
                  % outside the loop
        c(i) =c(i)*(1-2*alpha)+alpha*(c(i-1)+c(i+1)); 
                 %First boundary condition
    end % for i loop
    c(101)=c(i)*(1-2*alpha)+2*alpha*c(i-1); %Second boundary condition
    end
    plot(c, 'g', 'LineWidth', 1.5);
    text(54,0.6,'\leftarrow Concentration', 'FontSize',12);
end