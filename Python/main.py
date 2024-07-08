import pandas as pd

inputfile = pd.read_csv('agenti_vanzari.csv')

#Se incarca angajatii intr-o lista
vanzari = inputfile.loc[:,['Consilier vanzari']]
lista= vanzari['Consilier vanzari'].values.tolist()

print('Lista angajati din firma :\n', lista)
#Operatii Lista
lista.sort()
print('\nLista ordonata alfabetic a angajatilor:\n', lista)

lista.append('Nicolae Gheorghe')
lista.sort()
print ('\nS-a adaugat un nou angajat : Nicolae Gheorghe. \nSe reafiseaza lista :\n', lista)
print('\nNumar total angajati in lista: ', len(lista))

print('\nPrimul angajat din lista ordonata alfabetic este : ',lista[0])
print('\nUltimul angajat din lista oedinata alfabetic este: ',lista.pop())
