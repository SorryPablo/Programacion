clear all;clc
v=load('votos.txt');
n=numel(v);m=350;f=v;#f(v<sum(v)/10)=0 #Los que tengan menos del 10% quedan fuera
esc=zeros(1,n);
printf('f=');printf('%g',f);printf('\n');
for k=1:m
	[~,i]=max(f);
	esc(i)=esc(i)+1;
	f(i)=v(i)/(1+esc(i));
	printf('escano %i/%i a partido %i:  ',k,m,i)
	printf('%g ',f);printf('\n');
end
printf('%10s %10s %10s\n','Partidos','Votos','Escanos') #Usar %10s hace una tablita muy bonita
for i=1:n
	printf('%10i %10i %10i\n',i,v(i),esc(i))
end
