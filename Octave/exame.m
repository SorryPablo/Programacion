clear all;clc

function a=fun(x,y,n)
	u=abs(x*y');s=0;i=1;j=n;a=zeros(n,n);
	while s<u
		if rem(x(i)+y(j),2)==0
			s=s+x(i);i=1+rem(s,n);
		else
			s=s+y(j);j=1+rem(abs(u-s),n);
		end
		a(i,j)=s;
	end
end

n=input('n? ');
for i=1:n
	x(i)=i;
	y(i)=i^2+i;
end
printf('y= '); printf('%i ',y);
a=fun(x,y,n);
f=fopen('cli1.txt','w');
if f==-1
	error('error no arquivo');
end
for i=1:n
	for j=1:n
		if a(i,j)~=0
			fprintf(f,'%6i ',a(i,j));
		else
			fprintf(f,'%6s ','---');
		end
	end
	fprintf(f,'\n');
end
fclose(f);
