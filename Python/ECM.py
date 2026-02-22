import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

csv_path = r"d:\Programación\VSCode\Python\tabla6.csv"
x_col="f"    
y_col="t1"    
logar=True  

datos=pd.read_csv(csv_path)

x_raw=datos[x_col]
if logar:
    x=np.log(x_raw)
else:
    x=x_raw.copy()
y=datos[y_col]

n=len(x)

#Recta de regresión
sx=sum(x);sy=sum(y);sx2=sum(x**2);sxy=sum(x*y);sy2=sum(y**2)
a=(sy*sx2-sx*sxy)/(n*sx2-sx**2);b=(n*sxy-sx*sy)/(n*sx2-sx**2);
s=np.sqrt(sum((y-a-b*x)**2)/(n-2));sa=s*np.sqrt(sx2/(n*sx2-sx**2));sb=s*np.sqrt(n/(n*sx2-sx**2));
r=(n*sxy-sx*sy)/np.sqrt((n*sx2-sx**2)*(n*sy2-sy**2));r2=r**2
#Recta de regresión centrada en (x=0,y=0)
Sb=sxy/sx2;Ss=np.sqrt(sum((y-b*x)**2)/(n-1));Ssb=Ss/np.sqrt(sx2);Sr=sxy/np.sqrt(sx2*sy2);Sr2=Sr**2;

print("Sumatorios:")
print(sx,sy,sx2,sxy,sy2)
print("Recta de dos parm.")
print(r,r2,a,b,s,sa,sb)
print("Recta de un parm.")
print(Sb,Sr,Sr2,Ss,Ssb)

if logar:
    x_plot=x_raw
else:
    x_plot=x
x_recta=np.linspace(min(x), max(x), 100)
y_recta=b*x_recta+a
if logar:
    x_recta_plot=np.exp(x_recta)
else:
    x_recta_plot=x_recta

plt.plot(x_recta_plot, y_recta, color='r', label="Recta ajustada")
plt.scatter(x_plot, y, label="Datos")
plt.title("Regresión lineal{} $V(I)$ para el circuito en paralelo".format(" logarítmica" if logar else ""))
plt.xlabel("Intensidad (A){}".format(" [log]" if logar else ""))
plt.ylabel("Voltaje (V)")
plt.legend()
plt.grid(True)
if logar:
    plt.xscale('log')
plt.show()
