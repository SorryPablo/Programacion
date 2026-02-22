clear all; clc
nf='arquivo_R.txt'; f=fopen(nf);
if f==-1; error('fopen %s', error); end
l=fgetl(f); p=strsplit(l); p(1)=[]; m=numel(p)-1; n=0;
while ~feof(f) #feof mide si has acabado de leer el archivo. Su valor es 1
  fgetl(f); n=n+1;
end
a=zeros(n,m); y=cell(1,n); frewind(f); fgetl(f);
for i=1:n
	fscanf(f,'%d',1);
	a(i,:)=fscanf(f,'%g',m);
	y{i}= fscanf(f,'%s',1);
end
fclose(f);
#Mostra por pantalla
fprintf('%10s ',p{:}); fprintf('\n')
for i=1:n
	fprintf('%10g ', a(i,:));fprintf('%10s\n', y{i})
end
#Almacena en resultados.txt
nf='resultados.txt'; f=fopen(nf,'w');
if f==-1; print('erro fopen %s', nf);return;end
fprintf(f, '%10s ', p{:}); fprintf(f,'\n');
for i=1:n
     fprintf(f,'%10g ', a(i,:)); fprintf(f,'%10s\n', y{i});
end
fclose(f)
