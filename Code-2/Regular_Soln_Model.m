%  Non dimensional formula for the regular solution model
% \Delta G/RT = \omega *x(1-x)/RT + [x*ln(x)+(1-x)*ln(1-x)]

% Non dimensionalizing: \Delta G/RT as dg
% dg = \Delta G/RT 

% Non dimensionalizing: \omega/RT as \alpha 
% dg = alpha*x(1-x)+ds

% Non dimensional entropy of mixing
% ds = x*ln(x)+(1-x)*ln(1-x)

x = 0.001:0.001:0.999;
ds = x.*log(x)+(1-x).*log(1-x); 
alpha_a=0.1; 
dg_a=alpha_a.*x.*(1.-x);
plot(x,dg_a,x,ds,x,dg_a+ds)

hold on

alpha_b = 1.5;
dg_b=alpha_b.*x.*(1.-x);
plot(x,dg_b,x,ds,x,dg_b+ds)

hold on

alpha_c = 2.5;
dg_c=alpha_c.*x.*(1.-x);
plot(x,dg_c,x,ds,x,dg_c+ds)