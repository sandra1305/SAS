import pandas as pd

agenti = pd.read_csv("agenti_vanzari.csv")

salariati_selectati = agenti.loc[(agenti['Ani vechime'] < 10) & (agenti['Venit'] <= 4000), ['Consilier vanzari', 'Ani vechime', 'Venit']]

#selectie salariati conform citerii (vechime <10 ani si salariu < 4000 LEI)
print('Lista inainte de majorare : \n',salariati_selectati)

#aplicare majorare salariala
salariati_selectati['Venit'] *=1.4
print('Lista dupa modificare: \n', salariati_selectati)