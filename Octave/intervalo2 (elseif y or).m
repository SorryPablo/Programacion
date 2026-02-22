clear all;clc
%----------------
function y=funcionf(x)
	if or(x<-6,x>6)
        y=0;
    elseif x<-2
        y=4*exp(x+2);
    elseif x<2
        y=x^2;
    elseif x<6
        y=power(x+6.5,1/3);
    end
end
%----------------
a=-10;b=10;n=100;
x=linspace(a,b,n);
y=zeros(1,n);
for i=1:n
	y(i)=funcionf(x(i));
end
plot(x,y)
