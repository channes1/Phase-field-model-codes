%Construction of a phase diagram and spinodal 
%For a non dimensionalized regular solution model

%Non dimensional formula obtained from
%\frac{\Delta G}{RT} = \frac{\Omega x(1-x)}{RT} + [x*ln(x)+(1-x)*ln(1-x)].

%dg = \alpha x(1-x)+ds

% x = Composition

% a = \alpha (\frac{\Omega}{RT})

% \alpha = \frac{\Omega}{RT} [Non dimensional scaled regular solution parameter].

%ds = x ln(x) + (1-x) ln(1-x) [Non dimensional entropy of mixing].

%z = -2 \alpha + \frac{1}{x}+ \frac{1}{1-x} [Double differentiation to find spinodal].

%Function Spinodal.m is part of this script.

a(1)= 2.01;
x_a=[0.0001;0.5001];
x_b=[0.4999;0.9999];

for i=1:400
    e=@(x) Spinodal(a(i),x);
    f(i)=fzero(e, x_a);
    g(i)=fzero(e, x_b);
    a(i+1)=a(i)+0.01;
end

for i=1:400 % To get inverse of temperature
    b(i) = a(i);
end

plot(f,1./b,'r');
hold on 
plot(g,1./b,'r');