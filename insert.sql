SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE Odczyt;
TRUNCATE Okres_rozliczeniowy;
TRUNCATE Alarm;
TRUNCATE Miejsce_garazowe;
TRUNCATE Gosc;
TRUNCATE Oswietlenie;
TRUNCATE Rolety;
TRUNCATE Temperatura;
TRUNCATE Kamera;
TRUNCATE Pomieszczenie;
TRUNCATE Uzytkownik;
TRUNCATE Mieszkanie;

SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO Mieszkanie(Numer) VALUES (23),(45),(41);
INSERT INTO Uzytkownik(Imie,Nazwisko,Login,Haslo,fkMieszkanie,Wlasciciel) 
	VALUES ('Maria','Karenina','maria@gmail.com','maria',1,1),
	       ('Karol','Augustyn','karol@gmail.com','karol',1,0),
	       ('Aleksandra','Krystyna','ola@gmail.com','krystyna',2,1);

INSERT INTO Pomieszczenie(Nazwa,Typ,fkMieszkanie) 
	VALUES('Lazienka','Lazienka',2),
		('Garderoba','Garderoba',2),
		('Pokoj dziecka','Pokoj_dziecka',2),
		('Salon','Salon',2),
		('Kuchnia','Kuchnia',2),
		('Sypialnia','Sypialnia',2),
		('Sypialnia babci','Sypialnia',2);

INSERT INTO Rolety(Nazwa,Stan,fkPomieszczenie) 
	VALUES('Okno podworko',100,1),
		('Balkon',10,2),
		('Duze okno',50,3),
		('Male okno',70,4);

INSERT INTO Gosc(Imie,Nazwisko,Tablica_rejstracyjna,fkMieszkanie)
	VALUES('Ola','Kowalewska','WPL1111',2),('Marek','Stolarz','',2);

INSERT INTO Oswietlenie(Nazwa,Stan,fkPomieszczenie)
	VALUES('Dolne swiatlo','false',2);

INSERT INTO Temperatura(Zadana_temp,Aktualna_temp,Zewn_temp,fkPomieszczenie)
	VALUES(23.2,19.5,20.3,2);

INSERT INTO Miejsce_garazowe(Kod,Nr_rejstracyjny,fkMieszkanie)
	VALUES('A23','WL2345',2),('A24','WPI2314',1);

INSERT INTO Alarm(Data,Opis,fkMieszkanie) VALUES('2018-06-18T10:34:09','Intruz',2),('2018-02-18T10:20:09','Alarm pozarowy',2);
	




