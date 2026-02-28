import pandas as pd
import numpy as np
import os

df = pd.read_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla4.csv")

f  = df["f"]
finc = df["f_unc"]

R = 10**4   
C = 12e-9      

Xc = 1 / (2 * np.pi * f * C)
df["Z"] = np.sqrt(R**2 + Xc**2)
dXc =Xc*(finc/f)
df["dZ"]=np.abs(Xc / df["Z"])*dXc
df["logz"]=20*np.log(df["Z"])
df["dlogz"]=20*df["dZ"]/(df["Z"]*np.log(10))
df["Vr/Vc"]=df["v_r"]/df["v_c"]
df["dvr"]=np.sqrt((df["v_r_unc"]**2)/(df["v_c"]**2)+(((df["v_r"]**2)*df["v_c_unc"]**2)/(df["v_r"]**4)))

orden = ["f","f_unc","v","v_unc","v_r","v_r_unc","v_c","v_c_unc","dZ","Z","logz","dlogz","Vr/Vc","dvr"]
df = df[orden]

df.to_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla4mod.csv", index=False)