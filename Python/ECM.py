import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def flotante(s):
    s = str(s).strip().replace(',', '.')
    if s.startswith('E') or s.startswith('e'):
        s = '1' + s
    return float(s)

csv_path = r"c:\users\sorry\Downloads\Programación\Python\tabla4mod.csv" 
#csv_path = r"d:\Programación\Git\Python\tabla4mod.csv"
x_col = "f"
x_err_col = "f_unc"
y_col = "Vr/Vc"
y_err_col = "dvr"
regresion = True
una_var = True
logarx = False
logary = False
ponderado = True
rectas_extra = [] #(pendiente,ordenada)

datos = pd.read_csv(csv_path)


x1=datos[x_col]
y1=datos[y_col]
if y_err_col:
    y_err=datos[y_err_col].apply(flotante)
else:
    y_err=None
if x_err_col:
    x_err=datos[x_err_col].apply(flotante)
else:
    x_err=None
if ponderado:
    w=1/((y_err)**2)
else:
    w=1
if logarx:
    x=np.log(x1)
    if x_err is not None:
        x_err=x_err/(x1*np.log(10))
else:
    x=x1.copy()
if logary:
    y=np.log(y1)
    if y_err is not None:
        y_err=y_err/(y1*np.log(10))
else:
    y=y1.copy()

n=len(x)

if ponderado:
    sw=sum(w);sx=sum(w*x);sy=sum(w*y);sx2=sum(w*x**2);sxy=sum(w*x*y);sy2=sum(w*y**2)
    a=(sy*sx2-sx*sxy)/(sw*sx2-sx**2);b=(sw*sxy-sx*sy)/(sw*sx2-sx**2);
    s=np.sqrt((n/((n-2)*sw))*sum(w*(y-a-b*x)**2));sa=np.sqrt(sx2/(sw*sx2-sx**2));sb=np.sqrt(sw/(sw*sx2-sx**2));
    r=(sw*sxy-sx*sy)/np.sqrt((sw*sx2-sx**2)*(sw*sy2-sy**2));r2=r**2

    Sb=sxy/sx2;Ss=np.sqrt((sum(w*(y-Sb*x)**2)*n)/((n-1)*sw));
    Ssb=1/np.sqrt(sx2);Sr=sxy/np.sqrt(sx2*sy2);Sr2=Sr**2;
    print("Ponderado: dato extra:");print(sw)
else:
    sx=sum(x);sy=sum(y);sx2=sum(x**2);sxy=sum(x*y);sy2=sum(y**2)
    a=(sy*sx2-sx*sxy)/(n*sx2-sx**2);b=(n*sxy-sx*sy)/(n*sx2-sx**2);
    s=np.sqrt(sum((y-a-b*x)**2)/(n-2));sa=s*np.sqrt(sx2/(n*sx2-sx**2));sb=s*np.sqrt(n/(n*sx2-sx**2));
    r=(n*sxy-sx*sy)/np.sqrt((n*sx2-sx**2)*(n*sy2-sy**2));r2=r**2

    Sb=sxy/sx2;Ss=np.sqrt(sum((y-Sb*x)**2)/(n-1));Ssb=Ss/np.sqrt(sx2);Sr=sxy/np.sqrt(sx2*sy2);Sr2=Sr**2;

print("Sumatorios:")
print(sx,sy,sx2,sxy,sy2)
print("Recta de dos parm.")
print(r,r2,a,b,s,sa,sb)
print("Recta de un parm.")
print(Sb,Sr,Sr2,Ss,Ssb)

if logarx:
    x_plot=x1
else:
    x_plot=x
if logary:
    y_plot=y1
else:
    y_plot=y.copy()
x_recta=np.linspace(min(x), max(x), 100)
y_recta=b*x_recta+a
y_recta2=Sb*x_recta
if logarx:
    x_recta_plot=np.exp(x_recta)
else:
    x_recta_plot=x_recta
if logary:
    y_recta_plot=np.exp(y_recta);y_recta2_plot=np.exp(y_recta2)
else:
    y_recta_plot=y_recta;y_recta2_plot=y_recta2
if regresion:
    if una_var:
        plt.plot(x_recta_plot, y_recta2_plot, color='r', label="Recta ajustada")
    else:
        plt.plot(x_recta_plot, y_recta_plot, color='r', label="Recta ajustada")

    for idx,(m,c) in enumerate(rectas_extra, start=1):
        y_extra = m * x_recta + c
        if logarx:
            x_extra_plot = np.exp(x_recta)
        else:
            x_extra_plot = x_recta
        if logary:
            y_extra_plot = np.exp(y_extra)
        else:
            y_extra_plot = y_extra
        plt.plot(x_extra_plot, y_extra_plot, '--',color='green', label=f"Recta extra {idx}: y={m}x+{c}")
if y_err is not None:
    plt.errorbar(x_plot, y_plot, yerr=y_err,xerr=x_err, fmt='o',color='blue', label="Datos",barsabove=True)
else:
    plt.scatter(x_plot, y_plot, label="Datos",color='blue')
plt.title("Regresión lineal ponderada $V_{mR}/V_{mC}$ para el circuito de corriente alterna") #.format(" logarítmica" if logar else ""))
plt.xlabel("Frecuencia$(Hz)$")#.format(" [log]" if logar else ""))
plt.ylabel("$V_{mR}/V_{mC}$")
plt.legend()
plt.grid(True)
if logarx:
    plt.xscale('log')
if logary:
    plt.yscale('log')
plt.show()