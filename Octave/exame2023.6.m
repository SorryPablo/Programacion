clear all;clc;

function [a b]=fun(x,y)
	n=numel(x);m=numel(y);
	a=x'.*y;
	b=zeros(m,n);
	for i=1:m
		for j=1:n
			for l=1:j
				u=y(l);t=0;
				for k=1:i
					t=t+x(k)*u*a(l,k);
				end
			end
			b(i,j)=t;
		end
	end
end

f=fopen('cli6.txt','r');
x=fscanf(f,'%i');
fclose(f);
n=numel(x);s=0;i=1;
while true
	s=s+x(i);
	if n==i
		y=x(find(rem(x,2)==0));
		break
	end
	i=i+1;
	if s>20
		y=x(i:n);x(i:n)=[];
		break
	end
end
[a b]=fun(x,y);
disp('a=');disp(b);
disp('b=');disp(a);
