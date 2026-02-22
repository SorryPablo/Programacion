clear all;clc
pkg load symbolic                   #Carga el SymPy de "pitón"
syms x                              #Define variable simbólica x
xi=input('x?');n=100;
s=input('f(x)?','s');               #f(x) caracter ('s' para poder leer caracteres)
f=str2func(sprintf('@(x) %s',s));   #f(x) anonima
fs=sym(s);                          #f(x) símbolo
dfs=diff(fs,x);                     #f'(x) símbolo
df=matlabFunction(dfs);             #df=f'(x) funcion anónima
d=inf;i=1;
while d>1e-5 && i<n
    dfx=df(xi);
    if abs(dfx)<1e-15;printf('f"(%g)=0: usa outro x\n',xi);return;end
    xi1=xi-f(xi)/df(xi);
    d=abs(xi1-xi);
    printf('i=%d xi=%g xi1=%g d=%g\n',i,xi,xi1,d)
    xi=xi1;i=i+1;
end
if i<n
    printf('Solución=%g\n',xi1)
else
    pritnf('Non hai solucións en %d iteracións\n',i)
end


