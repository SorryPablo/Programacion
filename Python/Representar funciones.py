import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

df = pd.read_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla4mod.csv")
#df = pd.read_csv(r"d:\Programación\Git\Python\tabla5bmod.csv")

log_f=np.log10(df["f"])
z=df["logz"]
z_err=df["dlogz"]

x1=np.linspace(min(df["f"]),max(df["f"]),1000)
x2=np.log10(x1)
zt=20*np.log10(np.sqrt(10**8+(1/(2*np.pi*12*10**(-9)*x1))**2))

plt.errorbar(log_f, z, yerr=z_err, fmt='o', capsize=3, color='blue',label="datos")
plt.xlabel('$\log f \ (Hz)$')
plt.ylabel('$20\log Z \ (\Omega)$')
plt.title('')
plt.grid(True)

plt.plot(x2,zt,color='yellow',label="Curva RC")
plt.axvline(x=np.log10(1326.29),linestyle='--',color='green',label="Frecuencia de corte")
plt.axhline(y=20*np.log10(10000),color='r',label="Curva R")
plt.legend()
plt.show()