clear all;clc;
x0=0
x1=1
n=input('n?');
for i=1:n-1
    aux=x0+x1;
    printf('suigiente:%i\n',aux)
    x0=x1;x1=aux;
end