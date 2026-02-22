clear all;clc;

function [y a]=fun(x)
	n=numel(x);y=zeros(1,n);a=zeros(n);X=max(x);s=0;
	for i=1:n
		s=s+sin(x(i));
		y(i)=s/i;
	end
	for i=1:n
		for j=1:n
			m=min(x(i),x(j))/X;M=max(x(i),x(j))/X;
			if m==M
				a(i,j)=sum(y>m);
			else
				a(i,j)=sum(m<y & y<M);
			end
		end
	end
end

x=[];x=input('x(i)=? ');
n=numel(x);
xu=unique(x);xn=zeros(1,n);
disp('x sen repeticións:');
for i=xu
	xn(i)=sum(x==i);
	printf('Elemento %i aparece %i veces',i,xn(i));printf('\n')
end
[y a]=fun(x);
disp('y=');disp(y);
disp('a=');disp(a);
nf='datos3.txt';f=fopen(nf,'w');
if f==-1; error('error en %s',nf); end
for i=1:n
	for j=1:n
		if a(i,j)~=0
			fprintf(f,'%g ',a(i,j));
		end
	end
	fprintf(f,'\n');
end
fclose(f);
