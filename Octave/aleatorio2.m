clear all;clc
n=9;x=randi(100,1,n);
disp('x=');disp(x)
m=ceil((1+sqrt(1+8*n))/2);
a=zeros(m);k=1;
for i=1:m
	for j=i+1:m
		t=x(k);a(i,j)=t;a(j,i)=t;k=k+1;
		if k>n
			disp('a=');disp(a)
			return
		end
	end
end

