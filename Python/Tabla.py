import csv
from decimal import Decimal, ROUND_HALF_UP
import re
import math

def convertir_a_coma_decimal(texto):
    """Reemplaza puntos decimales por comas en números."""
    return re.sub(r'(\d)\.(\d)', r'\1,\2', texto)

def notacion_cientifica(x):
    x = x.strip()

    if "E" in x:
        base, exp = x.split("E")
        if base == "":
            return f"$10^{{{exp}}}$"
        else:
            base = convertir_a_coma_decimal(base)
            return f"${base} \\times 10^{{{exp}}}$"
    x = convertir_a_coma_decimal(x)
    return f"${x}$"

def mas_menos_latex(valor_str, error_str):

    error_str = error_str.strip()
    if error_str.startswith('E') or error_str.startswith('e'):
        error_str = '1' + error_str
    valor_str = valor_str.strip()
    if valor_str.startswith('E') or valor_str.startswith('e'):
        valor_str = '1' + valor_str
    
    valor = float(valor_str)
    error = float(error_str)
    
    if error == 0:
        return notacion_cientifica(valor_str)
    
    valor_abs = abs(valor)
    error_abs = abs(error)
    
    # Decidir si usar notación científica (si valor < 0.1 o > 100)
    usar_ciencia = valor_abs < 1e-1 or valor_abs > 1e2
    
    if usar_ciencia and valor_abs != 0:
        # Usar notación científica
        exp_valor = math.floor(math.log10(valor_abs))
        factor_valor = 10 ** exp_valor
        
        # Normalizar valor y error al mismo exponente
        valor_norm = valor / factor_valor
        error_norm = error / factor_valor
        
        # Redondear error a 2 cifras significativas
        error_norm_sig_dig = round(error_norm * 100) / 100
        
        # Ajustar valor al mismo nivel
        valor_norm_ajustado = round(valor_norm * 100) / 100
        
        # Calcular cuántos decimales tiene el error
        def contar_decimales(num):
            s = f"{num:.10f}".rstrip('0')
            if '.' in s:
                return len(s.split('.')[1])
            return 0
        
        decimales = contar_decimales(error_norm_sig_dig)
        
        v_str = f"{valor_norm_ajustado:.{decimales}f}"
        e_str = f"{error_norm_sig_dig:.{decimales}f}"
        v_str = convertir_a_coma_decimal(v_str)
        e_str = convertir_a_coma_decimal(e_str)
        
        return f"$({v_str} \\pm {e_str}) \\times 10^{{{exp_valor}}}$"
    else:
        exponente = math.floor(math.log10(error_abs)) if error_abs != 0 else 0
        factor = 10 ** exponente
        
        error_normalizado = error / factor
        error_redondeado_norm = round(error_normalizado * 100) / 100
        error_redondeado = error_redondeado_norm * factor
        
        valor_ajustado = round(valor * 100 / factor) / 100 * factor
        
        def contar_decimales(num):
            s = f"{num:.10f}".rstrip('0')
            if '.' in s:
                return len(s.split('.')[1])
            return 0
        
        decimales = contar_decimales(error_redondeado)
        
        v_str = f"{valor_ajustado:.{decimales}f}"
        e_str = f"{error_redondeado:.{decimales}f}"
        v_str = convertir_a_coma_decimal(v_str)
        e_str = convertir_a_coma_decimal(e_str)
        
        return f"$({v_str} \\pm {e_str})$"

def valor_mas_menos_latex(valor, error):

    base_v, exp_v = valor.split("E")
    base_v = float(base_v)
    exp_v = int(exp_v)

    if error.startswith("E"):
        base_e = 1.0
        exp_e = int(error[1:])
    else:
        base_e, exp_e = error.split("E")
        base_e = float(base_e)
        exp_e = int(exp_e)

    error_ajustado = base_e * 10**(exp_e - exp_v)
    
    base_v_str = convertir_a_coma_decimal(str(base_v))
    error_ajustado_str = convertir_a_coma_decimal(str(error_ajustado))
    return rf"$({base_v_str} \pm {error_ajustado_str}) \cdot 10^{{{exp_v}}}$"


def procesar_csv_con_errores(ruta_csv):

    with open(ruta_csv, newline="", encoding="utf-8") as f:
        reader = csv.reader(f)
        filas = list(reader)
    
    encabezados = filas[0]
    datos = filas[1:]
    
    pares = {} 
    usados = set()
    
    for i, col in enumerate(encabezados):
        if i in usados:
            continue
        
        for sufijo in ['_inc', '_err', '_unc']:
            col_error = col + sufijo
            if col_error in encabezados:
                j = encabezados.index(col_error)
                if j not in usados:
                    pares[i] = (j, sufijo)
                    usados.add(j)
                    break
    
    # Construir nuevos encabezados y datos
    nuevos_encabezados = ["Medidas"]  # Añadir columna de medidas
    nuevos_datos = [[] for _ in range(len(datos))]
    
    # Numerar medidas 1, 2, 3, ...
    for k in range(len(datos)):
        nuevos_datos[k].append(str(k + 1))
    
    for i, col in enumerate(encabezados):
        if i in usados:
            # Esta columna es un error, saltar
            continue
        
        nuevos_encabezados.append(col)
        
        if i in pares:
            # Esta magnitud tiene error, combinarlas
            j, sufijo = pares[i]
            for k, fila in enumerate(datos):
                valor = fila[i]
                error = fila[j]
                combinado = mas_menos_latex(valor, error)
                nuevos_datos[k].append(combinado)
        else:
            # Sin error, pasar como está
            for k, fila in enumerate(datos):
                nuevos_datos[k].append(notacion_cientifica(fila[i]))
    
    return nuevos_encabezados, nuevos_datos



def csv_a_latex(
    ruta_csv,
    ruta_salida="tabla3M1.tex",
    caption="-completar-",
    label="tab:completar",
    procesar_errores=True
):
    if procesar_errores:
        encabezados, datos = procesar_csv_con_errores(ruta_csv)
    else:
        with open(ruta_csv, newline="", encoding="utf-8") as f:
            reader = csv.reader(f)
            filas = list(reader)
        encabezados = filas[0]
        datos = [[notacion_cientifica(x) for x in fila] for fila in filas[1:]]
    
    n_cols = len(encabezados)
    
    # Formato de tabla con barras verticales: |c|c|c|...
    formato_tabular = "|" + "|".join(["c"] * n_cols) + "|"

    latex = []
    latex.append(r"\begin{table}[h]")
    latex.append(r"\centering")
    latex.append(r"\begin{tabular}{" + formato_tabular + r"}")
    latex.append(r"\hline")

    latex.append(" & ".join(encabezados) + r" \\")
    latex.append(r"\hline")

    for fila in datos:
        latex.append(" & ".join(fila) + r" \\")

    latex.append(r"\hline")
    latex.append(r"\end{tabular}")
    latex.append(rf"\caption{{{caption}}}")
    latex.append(rf"\label{{{label}}}")
    latex.append(r"\end{table}")

    with open(ruta_salida, "w", encoding="utf-8") as f:
        f.write("\n".join(latex))

csv_a_latex(
    "Python/tabla3.csv",
    ruta_salida="Python/tabla3.tex",
    caption="Voltaje e intensidad con errores",
    label="tab:VI",
    procesar_errores=True
)