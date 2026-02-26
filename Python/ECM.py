import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def flotante(s):
    s = str(s).strip().replace(',', '.')
    if s.startswith('E') or s.startswith('e'):
        s = '1' + s
    return float(s)

csv_path = r"c:\users\sorry\Downloads\Programación\Python\tabla1.csv" 
#csv_path = r"d:\Programación\VSCode\Python\tabla5.csv"
x_col = "i"
x_err_col = "i_err"
y_col = "v"
y_err_col = "v_err"
do_regresion = True
logar = False   
rectas_extra = [] #(pendiente,ordenada)

datos = pd.read_csv(csv_path)


x1=datos[x_col]
if logar:
    x=np.log(x1)
else:
    x=x1.copy()
y=datos[y_col]
if y_err_col:
    y_err=datos[y_err_col].apply(flotante)
else:
    y_err=None
if x_err_col:
    x_err=datos[x_err_col].apply(flotante)
else:
    x_err=None

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

print(datos.dtypes)
print(datos.head())
if logar:
    x_plot=x1
else:
    x_plot=x
x_recta=np.linspace(min(x), max(x), 100)
y_recta=b*x_recta+a
if logar:
    x_recta_plot=np.exp(x_recta)
else:
    x_recta_plot=x_recta
if do_regresion:
    plt.plot(x_recta_plot, y_recta, color='r', label="Recta ajustada")

    for idx,(m,c) in enumerate(rectas_extra, start=1):
        y_extra = m * x_recta + c
        if logar:
            x_extra_plot = np.exp(x_recta)
        else:
            x_extra_plot = x_recta
        plt.plot(x_extra_plot, y_extra, '--', label=f"Recta extra {idx}: y={m}x+{c}")
if y_err is not None:
    plt.errorbar(x_plot, y, yerr=y_err,xerr=x_err, fmt='o', label="Datos",barsabove=True)
else:
    plt.scatter(x_plot, y, label="Datos")
plt.title("Regresión lineal{} $V(I)$ para la resistencia $R_1$".format(" logarítmica" if logar else ""))
plt.xlabel("Intensidad (A){}".format(" [log]" if logar else ""))
plt.ylabel("Voltaje (V)")
plt.legend()
plt.grid(True)
if logar:
    plt.xscale('log')
plt.show()
