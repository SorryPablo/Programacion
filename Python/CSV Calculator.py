import pandas as pd
import numpy as np
import os

df = pd.read_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla5b.csv")
#df = pd.read_csv(r"d:\Programación\Git\Python\tabla5b.csv")

f=df["f"]
t1  = df["t1"]*10**(-3)
t1inc = df["t1_unc"]*10**(-3)
t2  = df["t2"]*10**(-3)
t2inc = df["t2_unc"]*10**(-3)
  
df["logf"]=np.log10(f)
df["dt"]=t2-t1
df["dt_unc"]=np.sqrt(t1inc**2+t2inc**2)
df["phi"]=2*np.pi*f*df["dt"]
df["phi_unc"]=2*np.pi*f*df["dt_unc"]
df["phig"]=df["phi"]*360/(2*np.pi)
df["phig_unc"]=df["phi_unc"]*360/(2*np.pi)

orden = ["f","logf","t1","t1_unc","t2","t2_unc","dt","dt_unc","phi","phi_unc","phig","phig_unc"]
df = df[orden]

df.to_csv(r"c:\Users\sorry\Downloads\Programación\Python\tabla5bmod.csv", index=False)
#df.to_csv(r"d:\Programación\Git\Python\tabla5bmod.csv", index=False)