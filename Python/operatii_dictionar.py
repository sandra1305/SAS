#Operatii dictionare
import pandas as pd
inputfile = pd.read_csv('agenti_vanzari.csv')
# Se extrag angajatii cu vanzarile aferente
vanzari = inputfile.loc[:, ['Consilier vanzari', 'Total vanzari']].values.tolist()

# Se creaza un dictionar cu formatul cheia 'NUME' si valoarea 'VANZARI'

dict = {}
for element in vanzari:
    cheie = {element[0]: element[1]}
    dict.update(cheie)

# print('Tuplurile din dictionar :\n',dict.items())

dict1 = dict.copy();
dict1.update({'Toma Marcel': 160000})
print('S-a realizat o copie a dictionarului initial si s-a modifica valoarea pentru TOMA MARCEL \n', dict1, "\n")


# Functie care afiseaza vaoarea maxima, respectiv minima a vanzarilor

def max_min_vanzari():
    max_val = 0
    min_val = 0
    for tuplu in vanzari:
        if (min_val == 0 or min_val > tuplu[1]):
            min_val = tuplu[1]
            agent_min = tuplu[0]
        if (max_val < tuplu[1]):
            max_val = tuplu[1]
            agent_max = tuplu[0]

    print('Cele mai mari vanzari :\n', agent_max, " : ", dict.get(agent_max), "EURO \n")
    print('Cele mai mici vanzari :\n', agent_min, " : ", dict.get(agent_min), " EURO\n")

    return max_val, min_val


def total_incasari():
    lista = dict.values()
    total = 0
    for suma in lista:
        total += suma

    return total


max_min_vanzari()
print('Total incasari companie (pe luna curenta): ', f"{total_incasari():,}", 'EURO')
