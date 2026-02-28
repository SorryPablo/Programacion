import matplotlib.pyplot as plt
import numpy as np

log_f = np.array([
    2.0, 2.301, 2.477, 2.602, 2.699, 2.778, 2.845, 2.903, 2.954, 3.0,
    3.041, 3.079, 3.114, 3.146, 3.176, 3.204, 3.230, 3.255, 3.279, 3.301
])
phi_deg = np.array([
    85.0, 80.6, 84.2, 72.0, 75.6, 65.7, 63.5, 57.6, 57.0, 53.3,
    53.8, 51.9, 48.6, 46.3, 49.7, 47.2, 41.6, 37.6, 37.0, 35.4
])
phi_err = np.array([
    2.1, 4.1, 4.9, 4.0, 5.0, 1.2, 1.4, 1.3, 1.4, 1.6,
    1.1, 1.2, 1.7, 1.4, 1.5, 1.6, 1.7, 1.8, 1.0, 0.4
])

plt.figure(figsize=(8,5))
plt.errorbar(log_f, phi_deg, yerr=phi_err, fmt='o', capsize=3, color='blue', label=r'$\varphi(\degree)$ vs $\log(f)$')
plt.xlabel(r'$\log(f) \ [Hz]$')
plt.ylabel(r'$\varphi \ (\degree)$')
plt.title('Desfase en función de la frecuencia (logaritmo de f)')
plt.grid(True)
plt.legend()
plt.show()