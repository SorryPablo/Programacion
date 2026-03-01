import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#df = pd.read_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla4.csv")
df = pd.read_csv(r"d:\Programación\Git\Python\tabla5bmod.csv")

log_f=df["logf"]
phi=df["phi"]
phi_err=df["phi_unc"]


plt.errorbar(log_f, phi, yerr=phi_err, fmt='o', capsize=3, color='blue',label="datos")
plt.xlabel(r'$\log(f) \ [Hz]$')
plt.ylabel(r'$\varphi \ (\degree)$')
plt.title('Desfase en función de la frecuencia (logaritmo de f)')
plt.grid(True)
plt.legend()
plt.show()

# x_recta_ex = np.linspace(min(x_data), max(x_data), 100)
# y_recta_ex=

# plt.plot(x_recta_ex, y_recta_ex, '--', color='green', label=f"Recta extra: y={b_extra}")