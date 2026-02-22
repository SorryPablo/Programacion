clear all;clc;
n=input('n?')
s=0;
for i=0:n
    s=s+(-1)^i/(2*i+1);
end
printf('Resultado para n=%i: %g y debería dar: %g\n',n,s,pi/4)
