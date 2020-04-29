--Anlegen einer Datenbank
CREATE DATABASE Systemhaus;
GO
USE Systemhaus;

CREATE TABLE Abteilung (
	AbteilungsID INT IDENTITY(1000,1) PRIMARY KEY,
	AbteilungsName VARCHAR(50) NOT NULL
);

CREATE TABLE Mitarbeiter (
	MitarbeiterID INT IDENTITY (1000,1) PRIMARY KEY ,
	Vorname VARCHAR(25) NOT NULL,
	Nachname VARCHAR(25) NULL,
	AbteilungsID INT NOT NULL
);

CREATE TABLE Projekte (
	ProjektID INT IDENTITY (1000,1) PRIMARY KEY,
	ProjektName VARCHAR(50) NOT NULL,
	KundenNr INT NOT NULL
);

CREATE TABLE Kunde (
	KundenNr INT IDENTITY (1000,1) PRIMARY KEY,
	Firmenname VARCHAR(50) NOT NULL
);

CREATE TABLE Auftrag (
	AuftragNr INT IDENTITY (1000,1) PRIMARY KEY,
	KundenNr INT NULL,
	ProjektID INT NULL,
	MitarbeiterID INT NOT NULL
);

CREATE TABLE Artikel (
	ArtikelNr INT IDENTITY (1000,1) PRIMARY KEY,
	Bezeichung CHAR(25) NOT NULL
);

CREATE TABLE Kategorie (
	Kategorienamen CHAR(50) NOT NULL
);
GO
--Hilfstabellen
CREATE TABLE ProjektMitarbeiter(	MitarbeiterID INT NOT NULL,	ProjektID INT NOT NULL);

CREATE TABLE AuftragArtikel(	AuftragNr INT NOT NULL,	ArtikelNr INT NOT NULL,);

CREATE TABLE Artikelkategorie(	ArtikelNr INT NOT NULL,	Kategorienamen CHAR(50) NOT NULL);

--Anlegen von Beziehungen
--Fremschlüssel von AuftragArtikel zu Auftrag
ALTER TABLE AuftragArtikel 
	ADD CONSTRAINT FK_AuftragArtikel_Auftrag FOREIGN KEY (AuftragNr) 
	REFERENCES Auftrag (AuftragNr);

--Fremdschlüssel von AuftragArtikel zu Artikel
ALTER TABLE AuftragArtikel
	ADD CONSTRAINT FK_AuftragArtikel_Artikel FOREIGN KEY (ArtikelNr) 
	REFERENCES Artikel (ArtikelNr);

--
ALTER TABLE Artikel ALTER COLUMN Bezeichung CHAR(50) NOT NULL;
ALTER TABLE AuftragArtikel ALTER COLUMN AuftragNr INT NULL;
ALTER TABLE AuftragArtikel ADD Preis MONEY;
ALTER TABLE AuftragArtikel ADD Menge INT DEFAULT 15;

ALTER TABLE AuftragArtikel ADD CONSTRAINT chk_min_time CHECK (Menge>=15);

ALTER TABLE AuftragArtikel DROP CONSTRAINT chk_min_time;

ALTER TABLE AuftragArtikel ADD PreisMenge AS (menge * (preis/60));


--Anlegen eines Datensatzes

--INSERT INTO Abteilung (AbteilungsName) VALUES ('Entwicklung');
--INSERT INTO Abteilung (AbteilungsName ) VALUES ('Buchhaltung');

INSERT INTO Auftrag(KundenNr, MitarbeiterID) VALUES (1,1);
INSERT INTO Artikel (Bezeichung) VALUES ('Arbeitsstunde Pascal Entwicklung');

INSERT INTO AuftragArtikel ( AuftragNr, ArtikelNr) VALUES (1000,1001);

INSERT INTO AuftragArtikel ( AuftragNr, ArtikelNr) VALUES (1000,1002);

INSERT INTO AuftragArtikel ( AuftragNr, ArtikelNr) VALUES (NULL,1002);

INSERT INTO AuftragArtikel (AuftragNr, ArtikelNr, Preis) VALUES (1000, 1002, 119.99 );
INSERT INTO AuftragArtikel (AuftragNr, ArtikelNr, Preis, Menge) VALUES (1000, 1002, 119.99, 0 );


SELECT * FROM AuftragArtikel;

--INSERT INTO Abteilung (AbteilungsID, AbteilungsName) VALUES (
--	(SELECT (MAX(AbteilungsID))+1 As NextAbtID FROM Abteilung) ,'Buchhaltung');






--SELECT (MAX(AbteilungsID)) As NextAbtID FROM Abteilung;


--SELECT * FROM Abteilung;
--SELECT * FROM Artikel;

--TRUNCATE TABLE Abteilung;

SELECT * FROM Auftrag;
SELECT * FROM Artikel;