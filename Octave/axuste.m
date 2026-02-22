clear all;clc;
z=load('regresion.txt');
x=z(1,:);y=z(2,:);n=2;

p=polyfit(x,y,n);#axuste duns datos por un plinomio
x2=linspace(min(x),max(x),100);y2=polyval(p,x2);
%--------------------------
clf;plot(x,y,'bs','markerfacecolor','b');
hold on;plot(x2,y2,'r-');grid on
mae=(mean(abs(y-polyval(p,x))));
title(sprintf('Axuste orde %d MAE=%g',n,mae))
