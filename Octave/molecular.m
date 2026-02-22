clear all;clc

nf='taboaperiodica.txt';f=fopen(nf);
if f==-1; printf('erro fopen %s',nf);return;end
x=textscan(f, '%s %s %f'); #Crea un array lendo fila a fila con el formato
fclose(f);

abrev=x{1};elementos=x{2};pa=x{3}; #x es un array de celdas por eso se usa {}
while 1
	el=input('fórmula (X para rematar)? ','s');
	if strcmp(el,'X'); break; end
		d=isletter(el);n=numel(el);
		ini=1;j=1;
		while j<n
			if d(j)==0; break; end
			j=j+1;
		end
end
