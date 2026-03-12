import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

from mpl_toolkits.axes_grid1.inset_locator import inset_axes, mark_inset
from matplotlib.ticker import MultipleLocator

def expandir_limites(valor_min, valor_max, margen_relativo):
    span = valor_max - valor_min
    if span == 0:
        referencia = abs(valor_min) if valor_min != 0 else 1.0
        span = 0.1 * referencia
    margen = margen_relativo * span
    return valor_min - margen, valor_max + margen


def obtener_limites_zoom(x_data, y_data, config_zoom):
    x_data = np.asarray(x_data)
    y_data = np.asarray(y_data)

    inicio, fin = config_zoom["indices"]
    orden = np.argsort(x_data)
    inicio = max(0, inicio)
    fin = min(len(orden) - 1, fin)
    mascara = np.zeros(len(x_data), dtype=bool)
    mascara[orden[inicio:fin + 1]] = True

    x_sel = x_data[mascara]
    y_sel = y_data[mascara]
    x1, x2 = expandir_limites(x_sel.min(), x_sel.max(), config_zoom["margen_x"])
    y1, y2 = expandir_limites(y_sel.min(), y_sel.max(), config_zoom["margen_y"])
    return (x1, x2), (y1, y2), mascara


def zoom(ax, x_plot, y_plot, config_zoom,
         x_recta_plot, y_recta_plot,
         x_err, y_err,
         logx=False, logy=False):
    (x1, x2), (y1, y2), mascara = obtener_limites_zoom(x_plot, y_plot, config_zoom)

    axins = inset_axes(
        ax,
        width=config_zoom["ancho"],
        height=config_zoom["alto"],
        loc=config_zoom["cuadrante"]
    )

    axins.scatter(x_plot, y_plot, color='blue', s=20)

    _xe = np.asarray(x_err)[mascara]
    _ye = np.asarray(y_err)[mascara]
    axins.errorbar(
        np.asarray(x_plot)[mascara], np.asarray(y_plot)[mascara],
        xerr=_xe, yerr=_ye,
        fmt='o', color='blue', markersize=4, barsabove=True
    )

    axins.plot(x_recta_plot, y_recta_plot, color='r')

    axins.set_xlim(x1, x2)
    axins.set_ylim(y1, y2)

    if logx:
        axins.set_xscale('log')
    if logy:
        axins.set_yscale('log')

    axins.tick_params(labelsize=6, length=3)
    axins.xaxis.set_major_locator(MultipleLocator(config_zoom["x_paso"]))
    axins.yaxis.set_major_locator(MultipleLocator(config_zoom["y_paso"]))
    axins.grid(True)

    mark_inset(ax, axins, loc1=2, loc2=4, fc="none", ec="0.5")

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
rectas_extra = []
usar_zoom = True
config_zoom = {
    "indices": (0, 10),
    "cuadrante": "lower right",
    "ancho": "45%",
    "alto": "45%",
    "margen_x": 0.08,
    "margen_y": 0.10,
    "x_paso": 250,
    "y_paso": 0.2,
}
config_ejes = {
    "x_paso": 1000,
    "y_paso": 0.5,
}

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
    a=(sy*sx2-sx*sxy)/(sw*sx2-sx**2);b=(sw*sxy-sx*sy)/(sw*sx2-sx**2)
    s=np.sqrt((n/((n-2)*sw))*sum(w*(y-a-b*x)**2));sa=np.sqrt(sx2/(sw*sx2-sx**2));sb=np.sqrt(sw/(sw*sx2-sx**2));
    r=(sw*sxy-sx*sy)/np.sqrt((sw*sx2-sx**2)*(sw*sy2-sy**2));r2=r**2

    Sb=sxy/sx2;Ss=np.sqrt((sum(w*(y-Sb*x)**2)*n)/((n-1)*sw))
    Ssb=1/np.sqrt(sx2);Sr=sxy/np.sqrt(sx2*sy2);Sr2=Sr**2
    print("Ponderado: dato extra:");print(sw)
else:
    sx=sum(x);sy=sum(y);sx2=sum(x**2);sxy=sum(x*y);sy2=sum(y**2)
    a=(sy*sx2-sx*sxy)/(n*sx2-sx**2);b=(n*sxy-sx*sy)/(n*sx2-sx**2)
    s=np.sqrt(sum((y-a-b*x)**2)/(n-2));sa=s*np.sqrt(sx2/(n*sx2-sx**2));sb=s*np.sqrt(n/(n*sx2-sx**2))
    r=(n*sxy-sx*sy)/np.sqrt((n*sx2-sx**2)*(n*sy2-sy**2));r2=r**2

    Sb=sxy/sx2;Ss=np.sqrt(sum((y-Sb*x)**2)/(n-1));Ssb=Ss/np.sqrt(sx2);Sr=sxy/np.sqrt(sx2*sy2);Sr2=Sr**2

print("Sumatorios:");print(sx,sy,sx2,sxy,sy2)
print("Recta de dos parm.");print(r,r2,a,b,s,sa,sb)
print("Recta de un parm.");print(Sb,Sr,Sr2,Ss,Ssb)

if logarx:
    x_plot=x1
else:
    x_plot=x
if logary:
    y_plot=y1
else:
    y_plot=y.copy()
_xc = (min(x) + max(x)) / 2
_xr = (max(x) - min(x)) / 2
x_recta=np.linspace(_xc - 2*_xr, _xc + 2*_xr, 100)
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
fig, ax = plt.subplots()
if regresion:
    if una_var:
        ax.plot(x_recta_plot, y_recta2_plot, color='r', label="Recta ajustada")
    else:
        ax.plot(x_recta_plot, y_recta_plot, color='r', label="Recta ajustada")

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
        ax.plot(x_extra_plot, y_extra_plot, '--',color='green', label=f"Recta extra {idx}: y={m}x+{c}")
if y_err is not None:
    ax.errorbar(x_plot, y_plot, yerr=y_err,xerr=x_err, fmt='o',color='blue', label="Datos",barsabove=True)
else:
    ax.scatter(x_plot, y_plot, label="Datos",color='blue')

if usar_zoom:
    zoom(ax, x_plot, y_plot, config_zoom, x_recta_plot,
         y_recta2_plot if una_var else y_recta_plot,
         x_err, y_err, logx=logarx, logy=logary)

_xp = config_ejes["x_paso"]
_yp = config_ejes["y_paso"]
ax.set_xlim(np.floor(float(np.asarray(x_plot).min()) / _xp) * _xp,
            np.ceil(float(np.asarray(x_plot).max()) / _xp) * _xp)
ax.xaxis.set_major_locator(MultipleLocator(_xp))
ax.set_ylim(np.floor(float(np.asarray(y_plot).min()) / _yp) * _yp,
            np.ceil(float(np.asarray(y_plot).max()) / _yp) * _yp)
ax.yaxis.set_major_locator(MultipleLocator(_yp))

ax.set_title("Regresión lineal ponderada $V_{mR}/V_{mC}$ para el circuito de corriente alterna", pad=12) #.format(" logarítmica" if logar else ""))
ax.set_xlabel("Frecuencia$(Hz)$")#.format(" [log]" if logar else ""))
ax.set_ylabel("$V_{mR}/V_{mC}$")
ax.legend()
ax.grid(True)
if logarx:
    ax.set_xscale('log')
if logary:
    ax.set_yscale('log')
plt.show()