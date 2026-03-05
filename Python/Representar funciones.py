import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

df = pd.read_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla4mod.csv")
#df = pd.read_csv(r"d:\Programación\Git\Python\tabla5bmod.csv")

f=df["f"]
finc=df["f_unc"]
vr=df["Vr/Vc"]
drv=df["dvr"]
xlin=np.linspace(min(df["f"]),max(df["f"]),1000)

plt.errorbar(f, vr,xerr=finc, yerr=drv, fmt='o', capsize=3, color='blue',label="datos")
plt.xlabel('Frecuencia $(Hz)$')
plt.ylabel('$V_{mR}/V_{mC}$')
plt.title('Regresión lineal $V_{mR}/V_{mC}$ para el circuito de corriente alterna')
plt.grid(True)


plt.plot(xlin,0.0006702072866859135*xlin,linestyle='-',color='r',label="Frecuencia de corte")
plt.legend()
plt.show()