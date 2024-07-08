data finantari;
    infile '/home/u63886173/My SAS Files/Finantare.csv' dsd firstobs=2 missover;
    length Marca $ 15;
    length Numar_Contract_Credit $ 10;
    length Tip_client $ 15;
    length Model $ 20;
    length Valuta $ 3;
    input Numar_Contract_Credit $
          Tip_client $
          Model $
          Valoare_garantie
          Valoare_finantata
          Valuta $
          Reducere_Nissan
          Tichet_Rabla
          Easy_Service
          Avans;
run;


proc print data=finantari(obs=10);
run;

proc format;
    value $tip_client
        'PJ' = 'Persoana juridica'
        'PF' = 'Persoana fizica';
run;


data credite_masini;
    infile '/home/u63886173/My SAS Files/Finantare.csv' dsd firstobs=2 missover;
    length Numar_Contract_Credit $ 10;
    length Tip_client $ 2;
    length Model $ 20;
    length Valuta $ 3;
    input Numar_Contract_Credit $
          Tip_client $
          Model $
          Valoare_garantie
          Valoare_finantata
          Valuta $
          Reducere_Nissan
          Tichet_Rabla
          Easy_Service
          Avans;
run;


proc print data=credite_masini;
    format Tip_client $tip_client.;
run


data DetaliiFinantariAuto;
    infile '/home/u63886173/My SAS Files/DetaliiCreditare.csv' dsd firstobs=2 missover;
    length Referinta $ 10;
    length Data_acordarii $ 10;
    length Data_scadenta $ 10;
    length Termen_acordare $ 12;
    length Tip_client $ 15;
    length Tip_dobanda $ 10;
    input Referinta $
          Valoare
          Valuta $
          Procent_dob
          Data_acordarii $
          Data_scadenta $
          Tip_client $
          Termen_acordare $
          Zile_restanta
          Rata_credit
          Tip_dobanda $;

    /* Conversia ratelor din EUR în RON */
    if Valuta = 'EUR' then do;
        Grup_Moneda_Finantare = 'Moneda straina';
        Rata_RON = 4.95 * Rata_credit;
    end;
run;

/* Afișarea datelor cu conversia aplicată */
title "Conversia din EUR in RON a valorii ratelor";
proc print data=DetaliiFinantariAuto noobs;
run;

data DetaliiFinantariAuto;
	infile '/home/u63886173/My SAS Files/DetaliiCreditare.csv' dsd;
	length Referinta $ 10;
	length Data_acordarii $ 10;
	length Data_scadenta $ 10;
	length Termen_acordare $ 12;
input Referinta $ Valoare Valuta $ Procent_dob Data_acordarii $ Data_scadenta $	
Tip_client $ Termen_acordare $ Zile_restanta	Rata_credit	Tip_dobanda $;
if Valuta EQ 'EUR' then 
do;
	ID_Finantare = substr(Referinta, 5, 7);
             end;

run;
title "Afisarea ID-ului dosarului de finantare";
proc print data=DetaliiFinantariAuto;
run;

data finantari;
    infile '/home/u63886173/My SAS Files/Finantare.csv' dsd firstobs=2 missover;
    length Marca $ 15;
    length Numar_Contract_Credit $ 10;
    length Tip_client $ 15;
    length Model $ 20;
    length Valuta $ 3;
    input Numar_Contract_Credit $
          Tip_client $
          Model $
          Valoare_garantie
          Valoare_finantata
          Valuta $
          Reducere_Nissan
          Tichet_Rabla
          Easy_Service
          Avans;
run;

data DetaliiFinantariAuto;
    infile '/home/u63886173/My SAS Files/DetaliiCreditare.csv' dsd firstobs=2 missover;
    length Referinta $ 10;
    length Data_acordarii $ 10;
    length Data_scadenta $ 10;
    length Termen_acordare $ 12;
    length Tip_client $ 15;
    length Tip_dobanda $ 10;
    input Referinta $
          Valoare
          Valuta $
          Procent_dob
          Data_acordarii $
          Data_scadenta $
          Tip_client $
          Termen_acordare $
          Zile_restanta
          Rata_credit
          Tip_dobanda $;
PROC SQL;
CREATE TABLE inner_join AS
SELECT * FROM finantari A, DetaliiFinantariAuto B
WHERE A.Numar_Contract_Credit = B.Referinta;
QUIT;

DATA FinantariAuto;
	infile '/home/u63886173/My SAS Files/Finantare.csv' dsd;
	length Marca $ 15;
	length Numar_Contract_Credit $ 10;
input Numar_Contract_Credit $ Tip_client $ Marca $;
run;
	INPUT Marca $ QASHQAI $ ARRIYA $ X-TRAIL$ JUKE$;
	Medie = MEAN (of C1 - C4);
RUN;
DATA FinantariAuto;
	infile '/home/u63886173/My SAS Files/Finantare.csv' dsd;
	ARRAY A [4];
	DO Tip_client = 1 TO 4;
		Marca = C[Valoare_finantata];
		OUTPUT;
	END;
	KEEP Credit Valoare_finantata Marca;
RUN;
Title "Finantarile auto din Aprilie 2024, per Marca si per Tip_client, cu total";
PROC PRINT DATA = FinantariAuto noobs
	 sumlabel='Total #by(Credit) ' grandtotal_label='Total General';
	BY Marca;
	SUM Valoare_finantata;
	VAR Marca Tip_client;
 RUN;
 
 data finantari;
    infile '/home/u63886173/My SAS Files/Finantare.csv' dsd firstobs=2 missover;
    length Marca $ 15;
    length Numar_Contract_Credit $ 10;
    length Tip_client $ 15;
    length Model $ 20;
    length Valuta $ 3;
    input Numar_Contract_Credit $
          Tip_client $
          Model $
          Valoare_garantie
          Valoare_finantata
          Valuta $
          Reducere_Nissan
          Tichet_Rabla
          Easy_Service
          Avans;
run;
PROC PRINT data=finantari;
RUN; 
PROC CORR  data=finantari;
	VAR Valoare_finantata;
	WITH Valoare_garantie;
	TITLE "Corelatia intre valoarea finantata si valoarea garantiei";
RUN;
PROC REG data=finantari;
	MODEL Valoare_finantata=Valoare_garantie;
	PLOT Valoare_finantata*Valoare_garantie;
	TITLE "Rezultatele analizei de regresie";
RUN;
