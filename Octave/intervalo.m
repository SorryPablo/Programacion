clear all;clc
%----------------
function y=funcionf(x)
	y=0;
	if x>=-6 && x<-2
		y=4*exp(x+2);
	elseif x>=-2 && x<2
		y=x^2;
	elseif  x>=2 && x<6
		y=(x+6.5)^(1/3);
	end
end
%----------------
a=-10;b=10;n=2000;
x=linspace(a,b,n);
y=zeros(1,n);
for i=1:n
	y(i)=funcionf(x(i));
end
plot(x,y)
