clear all;clc
pkg load symbolic

function [a,b]=coef(s,m)
    a=zeros(1,m+1);b=zeros(1,m);
    syms x;
    f=sym(s); #Pasar la funcion a simbolos
    #Cálculo de los coeficientes
    a(1)=double(int(f,x,-pi,pi));
    for n=1:m
        a(1+n)=double(int(f*cos(n*x),x,-pi,pi)); #Double pasa de nuevo de simbolo->numero
        b(n)=double(int(f*sin(n*x),x,-pi,pi));
    end
    a=a/pi;b=b/pi;
end

s=input('f(x)? ','s');
n=100;m=20;j=1:m;

x=linspace(-pi,pi,n);
[a,b]=coef(s,m);

g=str2func(sprintf('@(x) %s',s)) #De cadena de caracteres a funcion
f=zeros(1,n);F=zeros(1,n);
for i=1:n
    z=x(i);k=j*z;
    f(i)=g(z);
    F(i)=a(1)/2+a(j+1)*cos(k)'+b(j)*sin(k)';
end

mae=mean(abs(f-F));

clf;plot(x,f,'b-');hold on;
plot(x,F,'r');grid on;
legend({'f(x)','F(x)'},'location','southeast');
title(sprintf('MAE=%.5f',mae))
