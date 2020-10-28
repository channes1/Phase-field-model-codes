%Construction of a phase diagram and spinodal 
%For a non dimensionalized regular solution model

%Non dimensional formula obtained from

%\frac{\Delta G}{RT} = \frac{\Omega x(1-x)}{RT} + [x*ln(x)+(1-x)*ln(1-x)]

%dg = \alpha x(1-x)+ds

%alpha= \frac{\Omega}{RT} [Non dimensional scaled regular solution parameter]

%ds = x ln(x) + (1-x) ln(1-x) [Non dimensional entropy of mixing]

%z = -2 \alpha + \frac{1}{x} + \frac{1}{1-x} [Double differentiation]

function z = Spinodal(a,x)
      z=-2*a+1./(x)+1./(1-x);
end