clear all;clc
z=load('regresion.txt');
x=z(1,:);y=z(2,:);

n=numel(x);sx=sum(x);sx2=x*x';
sy=sum(y);
sxy=x*y';

d=n*sx2-sx^2;
a=(n*sxy-sx*sy)/d;
b=(sx2*sy-sx*sxy)/d;

printf('a=%g b=%g\n',a,b)
x2=[min(x) max(x)];y2=a*x2+b;
%--------------------------
clf;plot(x,y,'bs','markerfacecolor','b');
hold on;plot(x2,y2,'r-');grid on
title(sprintf('y=%.3fx+%.3f',a,b))  #sprinf sirve para poner liñas de texto como en este ejemplo
