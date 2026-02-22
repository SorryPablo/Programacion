clear all;clc
function [y z]=fun(x)
	n=numel(x);y=zeros(1,n);s=0;
	for i=1:n
		for j=1:i
			s=s+(-1)^j*(j+1);
		end
		y(i)=x(i)+s;
	end
	f=fopen('cli2.txt');
	if f==-1; error('arquivo non lido'); end
	z=fscanf(f,'%i');fclose(f);
end

x=input('x(i)? ');
[y z]=fun(x);
disp('y=');disp(y);
disp('z=');disp(z);
n=numel(x);m=numel(z);
a=zeros(n,m);
for i=1:n
	for j=1:m
		if rem(i*j,2)==0
			a(i,j)=numel(find(x>y(i)));
		else
			a(i,j)=numel(find(y<z(j)));
		end
	end
end
disp('a=');disp(a);
