CREATE DATABASE bioskop;
USE bioskop;


CREATE TABLE bioskop (
idb SMALLINT PRIMARY KEY,
nazivb VARCHAR(50) NOT NULL,
adresa VARCHAR(50),
ime_menadzera VARCHAR(50),
broj_telefona  VARCHAR(20)
);

CREATE TABLE sala (
ids SMALLINT PRIMARY KEY,
naziv VARCHAR(50) NOT NULL,
br_redova INT NOT NULL,
br_sedista INT NOT NULL,
idb SMALLINT REFERENCES bioskop (idb)
);

CREATE TABLE film (
idf SMALLINT PRIMARY KEY,
nazivf VARCHAR(50) NOT NULL,
datum_objavljivanja DATE,
duzina_filma  SMALLINT,
zemlja_porekla  VARCHAR(150) ,
ocena SMALLINT NOT NULL,
cena FLOAT,
broj_glasova INTEGER NOT NULL,
opis LONGTEXT
);

CREATE TABLE prikazivanje (
idf SMALLINT NOT NULL REFERENCES film (idf),
idb SMALLINT NOT NULL REFERENCES bioskop (idb),
od_datuma DATE NOT NULL,
do_datuma DATE,
PRIMARY KEY(idf, idb)
);

CREATE TABLE projekcija (
idf SMALLINT NOT NULL REFERENCES film (idf),
ids SMALLINT NOT NULL  REFERENCES sala (ids),
tip_projekcije VARCHAR(50) NOT NULL,
datum DATE NOT NULL,
pocetak TIME NOT NULL,
kraj TIME NOT NULL,
PRIMARY KEY(idf, ids, datum)
);

CREATE TABLE kupac(
idk SMALLINT PRIMARY KEY,
ime VARCHAR(30) NOT NULL,
prezime VARCHAR(30) NOT NULL,
popust SMALLINT NOT NULL
);


CREATE TABLE karta(
idf SMALLINT NOT NULL REFERENCES film (idf),
ids SMALLINT NOT NULL REFERENCES sala (ids),
idk SMALLINT REFERENCES kupac (idk),
br_reda SMALLINT NOT NULL,
br_sed SMALLINT NOT NULL,
cena  SMALLINT NOT NULL,
PRIMARY KEY(idf, ids, idk, br_reda, br_sed)
);

CREATE TABLE zaposleni (
idzap SMALLINT PRIMARY KEY,
ime VARCHAR(50) NOT NULL,
prezime VARCHAR(50) NOT NULL,
datum_rodjenja  DATE NOT NULL);

CREATE TABLE glumi (
idzap SMALLINT NOT NULL REFERENCES zaposleni (idzap),
idf SMALLINT NOT NULL REFERENCES film (idf),
uloga VARCHAR(50) NOT NULL,
honorar FLOAT,
PRIMARY KEY(idzap, idf)
);

CREATE TABLE radi (
idzap SMALLINT NOT NULL REFERENCES zaposleni (idzap),
idf SMALLINT NOT NULL REFERENCES film (idf),
posao VARCHAR(50) NOT NULL,
honorar FLOAT,
PRIMARY KEY(idzap, idf)
);

CREATE TABLE zanr (
idz SMALLINT PRIMARY KEY,
ime VARCHAR(50) NOT NULL,
opis VARCHAR(150)
);

CREATE TABLE zanr_filma (
idz SMALLINT NOT NULL REFERENCES zanr (idz),
idf SMALLINT NOT NULL REFERENCES film (idf),
PRIMARY KEY(idz, idf)
);


INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(1,'Milos', 'Biković', '1988-11-12');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(2,'Milena', 'Radulović', '2003-01-27');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(3,'Milan', 'Marić', '1998-07-31');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(4,'Tamara', 'Dragićević', '1989-03-30');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(5,'Nikola', 'Đuričko', '1974-07-09');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(6,'Aleksandar ', 'Berček', '1956-11-10');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(7,'Dragan ', 'Bjelogrlić', '1963-11-11');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(8,' Srđan ', ' Dragojević ', '1977-04-09');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(9,' Andrej ', 'Vologin', '1981-05-12');
INSERT INTO zaposleni (idzap, ime, prezime, datum_rodjenja) VALUES(10,'Zdravko ', 'Šotra', '1976-04-09');

INSERT INTO film (idf, nazivf, datum_objavljivanja, duzina_filma , zemlja_porekla, ocena, cena, broj_glasova, opis) VALUES(1,'Montevideo, Bog te video! ', '2015-10-11', 153, 'Srbija', 7.8, 500.00, 21340,'Montevideo, Bog te video! je srpski film iz 2010.To je rediteljski prvenac srpskog glumca Dragana Bjelogrlića po scenariju Srđana Dragojevića i Ranka Božića. Scenario je napisan po istoimenoj knjizi sportskog novinara Vladimira Stankovića koja govori o velikom uspehu reprezentacije Kraljevine Jugoslavije (koju su tada činili samo igrači iz Srbije) na Svetskom prvenstvu u fudbalu u Urugvaju1930. Film se sastoji iz dva dela (odnosno tri priče), a od snimljenog materijala napravljena je i TV-serija od 27 epizoda koja se sastoji iz tri sezone.  ');

INSERT INTO film (idf, nazivf, datum_objavljivanja,duzina_filma ,zemlja_porekla,ocena, cena, broj_glasova, opis) VALUES(2,'Balkanska međa ', '2020-07-10', 123, 'Rusija', 6.8, 400.00, 71340,
' Neposredno posle ratnog plamena u Bosni, na Balkanu raste novo žarište. (Balkanskiy rubezh, 2019)Sukobi Srba i Albanaca na Kosovu nekontrolisano rastu, srpske snage pokušavaju da potisnu "Oslobodilačku vojsku Kosova". Međunarodna zajednica optužuje vladu u Beogradu za prekomernu upotrebu sile i bez saglasnosti Ujedinjenih nacija NATO počinje bombardovanje Srbije.
Inspirisan ovim istorijskim događajem, film "Balkanska međa" prikazuje nam tajnu operaciju grupe ruskih specijalaca koja iz Moskve dobija naređenje da pre NATO trupa zauzme aerodrom "Slatina" u Prištini i zadrži ga dok ne stigne pojačanje.Dok se čeka pojačanje ruskog bataljona stacioniranog u Bosni, specijalni tim predvođen Andrejem Šatalovim i Bekom Ethoevim kojima se pridružuje pripadnici MUP-a Vuk i Fadilj, vode nemilosrdni rat protiv komandanta albanske terorističke grupe Smuka.
Uloge: Miloš Biković, Anton Pampušni, Jurij Kucenko, Aleksandar Radojičić, Miodrag Radonjić, Aleksandar Srećković, Milena Radulović...
Režija: Andrej Volgin ');

INSERT INTO film (idf, nazivf, datum_objavljivanja,duzina_filma ,zemlja_porekla,ocena, cena, broj_glasova, opis) VALUES(3,'Toma', '2021-04-05', 113, 'Srbija', 8.8, 350.00, 50340,
'Toma srpski je biografsko-dramski film iz 2021. godine, reditelja Dragana Bjelogrlića i Zorana Lisinca, temeljen na ideji Bjelogrlića, Željka Joksimovića i Baneta Obradovića. Scenaristi su Zoran Lisinac, Nikola Pejaković, Bjelogrlić i Maja Todorović, dok su producenti filma Nataša Višić, Goran Bjelogrlić, Dragan Bjelogrlić, Joksimović i Vladimir Lisinac. Muziku je komponovao Željko Joksimović.
Snimanja su počela tokom leta 2020.i trajala s prekidima do aprila 2021. godine na lokacijama u Valjevu, Beogradu, Avali, Perlezu, Tari, Barandi, Pančevu, Priboju, Prijepolju, Crnoj Gori, Dolovu, Zrenjaninu i Čikagu. 
Glavnu ulogu igra Milan Marić kao Toma Zdravković, dok sporedne uloge igraju Tamara Dragičević, Petar Benčina i Andrija Kuzmanović. Premijera filma bila je 20.avgusta 2021. u završnici 27. Sarajevskog filmskog festivala, a zatim i 21.avgusta 2021. godine na Festivalu glumačkih ostvarenja Filmski susreti.Film je objavljen 16.septembra 2021. godine u bioskopima u Srbiji, distributera Art Vista-e.  ');
INSERT INTO film (idf, nazivf, datum_objavljivanja,duzina_filma ,zemlja_porekla,ocena , cena, broj_glasova, opis) VALUES(4,'Šešir profesora Koste Vujića ', '2015-01-11', 117, 'Srbija', 9,550.00, 3300,
'Ovo je priča i o neverovatnom razredu maturanata Prve muške gimnazije koju čine Mihailo Petrović - Mika Alas, Jovan Cvijić, Pavle Popović, Jaša Prodanović, Milorad Mitrović, Milutin K. Dragutinović, Ljubomir Stojanović i drugi, koji će postati istorijsko oličenje epohe, kao akademici, profesori, ministri, političari i drugi uglednici. To je razred za sva vremena, kakvog nije bilo ni pre ni posle. Razred za istoriju i ponos.Oni su, ispunjeni nesputanom energijom mladosti, u život ušli korakom kojim se meri vreme. '
);

INSERT INTO radi(idzap,idf, posao, honorar) VALUES(8 , 1,'Scenarista ',10000);
INSERT INTO radi(idzap,idf, posao, honorar) VALUES(7, 1,'Režiser ',20000);
INSERT INTO radi(idzap,idf, posao, honorar) VALUES(9 ,2,'Režiser ',30000);
INSERT INTO radi(idzap,idf, posao, honorar) VALUES(7, 3,'Režiser ',25000);
INSERT INTO radi(idzap,idf, posao, honorar) VALUES(10,4,'Režiser ',22000);

INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(1,1,' Аleksandar Tirnanic - Tirke',15000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(5,1, 'Živković ',5000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(4,1, 'Eli Pops',2000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(1,2,'Vuk Majevski ',13000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(2,2,'Jasna Blagojević ',7000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(3,3,'Toma Zdravković ',7000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(4,3,'Silvana Armeulić ',5000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(2,3,'Nada ',3000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(1,4,'Mihailo Petrović Alas',5000);
INSERT INTO glumi (idzap,idf, uloga, honorar) VALUES(6,4,'Profesor Kosta Vujić',10000);

INSERT INTO zanr(idz,ime, opis) VALUES(1,'Biografski ','');
INSERT INTO zanr(idz,ime, opis) VALUES(2,'Komedija','');
INSERT INTO zanr(idz,ime, opis) VALUES(3,' Ljubavni','');
INSERT INTO zanr(idz,ime, opis) VALUES(4,' Sportski','');
INSERT INTO zanr(idz,ime, opis) VALUES(5,'Drama','');
INSERT INTO zanr(idz,ime, opis) VALUES(6,'Istorijski ','');
INSERT INTO zanr(idz,ime, opis) VALUES(7,' Ratni','');
INSERT INTO zanr(idz,ime, opis) VALUES(8,' Pustolovni','');
INSERT INTO zanr(idz,ime, opis) VALUES(9,' Akcijski','');


INSERT INTO zanr_filma(idz,idf) VALUES(2,1);
INSERT INTO zanr_filma(idz,idf) VALUES(3,1);
INSERT INTO zanr_filma(idz,idf) VALUES(4,1);
INSERT INTO zanr_filma(idz,idf) VALUES(8,1);
INSERT INTO zanr_filma(idz,idf) VALUES(5,1);
INSERT INTO zanr_filma(idz,idf) VALUES(6,1);
INSERT INTO zanr_filma(idz,idf) VALUES(9,2);
INSERT INTO zanr_filma(idz,idf) VALUES(7,2);
INSERT INTO zanr_filma(idz,idf) VALUES(6,2);
INSERT INTO zanr_filma(idz,idf) VALUES(5,2);
INSERT INTO zanr_filma(idz,idf) VALUES(8,2);
INSERT INTO zanr_filma(idz,idf) VALUES(1,3);
INSERT INTO zanr_filma(idz,idf) VALUES(5,3);
INSERT INTO zanr_filma(idz,idf) VALUES(2,4);

INSERT INTO bioskop(idb,nazivb,adresa,ime_menadzera,broj_telefona  ) VALUES(1,'Fontana', 'Pariske komune 13', 'Jasna Filipović', '0112670469');
INSERT INTO bioskop(idb,nazivb,adresa,ime_menadzera,broj_telefona  ) VALUES(2,'Cineplexx Ušće', 'Bulevar Mihajla Pupina',  'Milan Mrđa','0113113370');
INSERT INTO bioskop(idb,nazivb,adresa,ime_menadzera,broj_telefona  ) VALUES(3,'Cineplexx 4D Delta City', 'Jurija Gagarina 16', 'Milena Jović', '0632640469');
INSERT INTO bioskop(idb,nazivb,adresa,ime_menadzera,broj_telefona  ) VALUES(4,'Zvezda', 'Terazije 40', 'Ljubica Stojanović', '0642670449');

INSERT INTO sala (ids, idb, naziv, br_redova,  br_sedista) VALUES(1, 1, ' Plava', 3,10);
INSERT INTO sala (ids, idb, naziv, br_redova,  br_sedista) VALUES(2, 1, ' Crvena', 3,10);
INSERT INTO sala (ids, idb, naziv, br_redova,  br_sedista) VALUES(3, 2, ' Horizont1', 4,15);
INSERT INTO sala (ids, idb, naziv, br_redova,  br_sedista) VALUES(4, 2, ' Horizont2', 4,15);
INSERT INTO sala (ids, idb, naziv, br_redova,  br_sedista) VALUES(5, 3, '4D', 3,10);
INSERT INTO sala (ids, idb, naziv, br_redova,  br_sedista) VALUES(6, 4, 'Berčekova sala', 3,10);

INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(1, 1, '2015-10-11', '2020-10-11');
INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(1, 2, '2017-10-11', NULL);
INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(2, 1, '2017-10-11', NULL);
INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(2,2, '2021-05-11', NULL);
INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(3, 1, '2015-09-10', '2020-11-10');
INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(3, 3, '2020-09-10',NULL);
INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(4, 2, '2019-09-10',NULL);
INSERT INTO prikazivanje (idf, idb, od_datuma, do_datuma) VALUES(4,4, '2018-09-10',NULL );

INSERT INTO projekcija (idf, ids, tip_projekcije, datum,pocetak, kraj) VALUES(3, 1, 'Premijera', , '2021-05-05','20:00' ,'21:30');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj)VALUES(1, 1, 'Redovna', '2015-10-12', '20:00' , '21:30');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj)VALUES(1, 3, 'Redovna', '2021-05-04', '20:00' , '21:30');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj)VALUES(2, 2, 'Redovna', '2020-10-04', '20:00' , '21:30');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj)VALUES(2, 4, 'Redovna', '2015-06-09', '20:00' , '21:30');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj)VALUES(3, 1, 'Redovna', '2015-09-08', '20:00' , '21:30');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj) VALUES(3, 5, 'Redovna', '2015-09-08', '19:00' , '21:00');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj) VALUES(4, 3, 'Redovna', '2015-09-08', '20:00' , '21:30');
INSERT INTO projekcija (idf, ids, tip_projekcije, datum, pocetak, kraj) VALUES(4, 4, 'Redovna', '2015-09-08', '20:00' , '21:30');


INSERT INTO kupac (idk,  ime, prezime, popust) VALUES(1, 'Snezana', 'Milovanovic', 30);
INSERT INTO kupac (idk,  ime, prezime, popust) VALUES(2, 'Dimitrije', 'Ilic', 30);
INSERT INTO kupac (idk,  ime, prezime, popust) VALUES(3, 'Slobodan', 'Vidovic', 30);
INSERT INTO kupac (idk,  ime, prezime, popust) VALUES(4, 'Sinisa', 'Rokvic', 30);
INSERT INTO kupac (idk,  ime, prezime, popust) VALUES(5, 'Suzana', 'Zelenovic', 30);
INSERT INTO kupac (idk,  ime, prezime, popust) VALUES(6, 'Slobodanka', 'Adonic', 30);
INSERT INTO kupac (idk,  ime, prezime, popust) VALUES(7, 'Savina', 'Kupres', 30);

INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(1, 1, 1,  1, 2, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(1, 1, 2, 1, 3, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(1, 1, 3, 1, 4, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(1, 1, 4, 1, 5, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(1, 1, 5, 1, 6, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(2, 1, 6, 1, 7, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(2, 2, 1, 1, 2, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(2, 2, 1, 3, 3,  500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(2, 3, 1, 1, 2, 500);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(3, 5, 1, 1, 2, 550);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(3, 5, 6, 1, 3, 550);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(3, 5,7, 1, 4, 550);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(3, 1,5, 1, 5, 550);

INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(4, 4, 7, 2, 1, 400);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(4, 4, 1, 2, 2, 400);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(4, 6, 2, 2, 3, 400);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(4, 6, 3, 1, 1, 400);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(4, 6, 4, 1, 2, 400);
INSERT INTO karta (idf, ids,idk,  br_reda , br_sed , cena) VALUES(4, 6, 5, 1, 3, 400);


