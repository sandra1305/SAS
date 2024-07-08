import pandas as pd

vanzari = pd.read_csv("masini_vandute.csv")
agenti = pd.read_csv("agenti_vanzari.csv")

#Selectie vamzari pe zona de Vest
selectie_vanzari_zona = vanzari.loc[(vanzari['Zona']=='Sud'),['Zona','Marca','Cantitate']]
vanzari_model = vanzari.loc[(vanzari['Zona']=='Sud'),['Zona','Marca','Cantitate']].groupby(['Zona','Marca']).agg({'Cantitate':sum})

print('Situatie vanzari auto pe Zona de sud : \n', vanzari_model)

#Selectie *primii trei agenti dupa vanzari
top_agenti = agenti.sort_values(by='Total vanzari',ascending=False).iloc[0:3,[1,3,4,6,8]]
print('Top 3 agenti dupa vanzari : \n', top_agenti)