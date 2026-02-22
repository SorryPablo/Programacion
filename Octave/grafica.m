clear all;clc
warning off all
n=4;m=100;x=linspace(-pi,pi,m);
#------------------------------
f=cell(1,n);
f{1}=inline('sin(x).*cos(x)');
f{2}=@(x) sin(cos(2*x)); #Funcion anonima
f{3}=str2func('@(x) sin(x)');
f{4}=@cos;
#Creo que son 4 formas distintas de crear una funcion
#---(Hace lo mismo que lo de arriba)
#f=(inline('sin(x).*cos(x)'),@(x) sin(cos(2*x)), str2func('@(x) sin(x)'),@cos);
#------------------------------
#Congela la grafica, no borra lo anterior
c={'b','r','g','k'};
label=cell(1,n);label{1}='sin(x)*cos(x)';
for i=2:n; label{i}=func2str(f{i}); end
clf;hold on
for i=1:n
    y=feval(f{i},x);
    #y=f{i}(x);
    plot(x,y,c{i})
end
grid on
legend(label,'location','bestoutside')
