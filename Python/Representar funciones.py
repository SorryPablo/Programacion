import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from mpl_toolkits.axes_grid1.inset_locator import inset_axes, mark_inset
from matplotlib.ticker import MultipleLocator

df = pd.read_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla4mod.csv")
#df = pd.read_csv(r"d:\Programación\Git\Python\tabla4mod.csv")

log_f=np.log10(df["f"])
z=df["logz"]
z_err=df["dlogz"]
_fc = (min(df["f"]) + max(df["f"])) / 2
_fr = (max(df["f"]) - min(df["f"])) / 2
x1=np.linspace(_fc - 2*_fr, _fc + 2*_fr, 1000)
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

ax = plt.gca()
x_paso = 0.2;  x_min = 1.8;  x_max = 3.8
y_paso = 5;     y_min = 70;   y_max = 110
ax.set_xlim(x_min, x_max); ax.set_ylim(y_min, y_max)
ax.xaxis.set_major_locator(MultipleLocator(x_paso))
ax.yaxis.set_major_locator(MultipleLocator(y_paso))
ax.tick_params(axis='x', labelsize=8, labelrotation=35)
ax.tick_params(axis='y', labelsize=8, pad=6)
axins = inset_axes(ax, width="38%", height="38%", loc="lower left")
axins.scatter(x=np.log10(1326.29), y=80, color='gold',label="Pto de corte de R y C")
axins.scatter(x=np.log10(1326.29), y=20*np.log10(np.sqrt(10000**2 + (1/(2*np.pi*12e-9*1326.29))**2)), color='aqua',label="Impedancia teórica en $f_c$")
axins.axvline(x=np.log10(1326.29), linestyle='--', color='darkorange',label="Frecuencia de corte")
axins.plot(x2, zt, color='fuchsia',label="Curva RC")
axins.axhline(y=20*np.log10(10000), color='r',label="Curva R")
axins.plot(x2, y1, color='springgreen',label="Curva C")
axins.errorbar(log_f, z, yerr=z_err, fmt='o', capsize=3, color='blue',label="Datos")
axins.set_xlim(2.8, 3.4); axins.set_ylim(75, 90)
zoom_x_paso = 0.1
zoom_y_paso = 2.5
axins.tick_params(axis='x', labelsize=6, length=3, labelbottom=False, labeltop=True, pad=1)
axins.tick_params(axis='y', labelsize=6, length=3, labelleft=False, labelright=True)
axins.xaxis.set_major_locator(MultipleLocator(zoom_x_paso))
axins.yaxis.set_major_locator(MultipleLocator(zoom_y_paso))
axins.grid(True)
mark_inset(ax, axins, loc1=2, loc2=4, fc="none", ec="0.5")

ax.legend(loc="upper right")
plt.tight_layout()
plt.show()