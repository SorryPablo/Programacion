import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#df = pd.read_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla4mod.csv")
df = pd.read_csv(r"d:\Programación\Git\Python\tabla4mod.csv")

log_f=np.log10(df["f"])
z=df["logz"]
z_err=df["dlogz"]
x1=np.linspace(min(df["f"]),max(df["f"]),1000)
x2=np.log10(x1)
y1=20*np.log10(1/(2*np.pi*12*10**(-9)*x1))
zt=20*np.log10(np.sqrt(10**8+(1/(2*np.pi*12*10**(-9)*x1))**2))

plt.scatter(x=np.log10(1326.29),y=80,color='gold',label='Pto de corte de R y C')
plt.scatter(x=np.log10(1326.29),y=20*np.log10(np.sqrt(10000**2 + (1/(2*np.pi*12e-9*1326.29))**2)),color='aqua',label='Impedancia teórica en $f_c$')
plt.axvline(x=np.log10(1326.29),linestyle='--',color='darkorange',label="Frecuencia de corte")
plt.errorbar(log_f, z, yerr=z_err, fmt='o', capsize=3, color='blue',label="datos")
plt.plot(x2,zt,color='fuchsia',label="Curva RC")
plt.axhline(y=20*np.log10(10000),color='r',label="Curva R")
plt.plot(x2,y1,color='springgreen',label="Curva C")
plt.xlabel('$\log f \ (-)$')
plt.ylabel('$20\log Z \ (-)$')
plt.title('Curvas de la impedancia $Z$ frente a la frecuencia $\log f$')
plt.grid(True)

plt.legend()
plt.show()