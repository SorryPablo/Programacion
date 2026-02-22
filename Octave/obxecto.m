clear all;clc;

p=punto(1,2); #Chamada ao obxecto
fprintf('p.x=%g p.y=%g\n\n',p.x,p.y)

#Clase masa derivada de punto----------
m=masa(3,4,5);
printf('m.x=%g m.y=%g m.m=%g\n\n',m.x,m.y,m.m)

# Polimorfismo-------------------------
printf('polimorfismo:\n');p.mostra;m.mostra;printf('\n\n');
#Funcións dunha clase (p.subprog(argumentos))

#Polimorfismo en bucle-----------------
printf('polimorfismo en bucle:\n')
f={p,m};n=numel(f);
for i=1:n
    f{i}.mostra
end
printf('\n\n');

#Sobrecarga de operadores--------------
printf('sobrecarga de operadores + para punto:\n')
s=p+m;
s.mostra

