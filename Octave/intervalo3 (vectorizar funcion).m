clear all;clc
%----------------
function y=funcionf(x)
	n=numel(x);y=zeros(1,n);
    i=find(x>=-6 & x<-2);y(i)=4*exp(x(i)+2);
    i=find(x>=-2 & x<2);y(i)=x(i).^2; #OJO OJO OJO con el punto .^2 haces que deje de ser matricial, sino comp. a comp.
    i=find(x>=2 & x<6);y(i)=nthroot(x(i)+6.5,3);
end
%----------------
a=-10;b=10;n=1000000;
x=linspace(a,b,n);
y=funcionf(x);
plot(x,y)
