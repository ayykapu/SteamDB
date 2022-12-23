--Kacper Kurek 14545
--skrypt sprawdza czy istnieje baza o ponizszej nazwie, jesli tak usuwa ja

DROP DATABASE IF EXISTS BazaDanychSteam;

IF NOT EXISTS (
        SELECT *
        FROM sys.databases
        WHERE name = 'BazaDanychSteam'
        )
BEGIN

--stworzenie bazy

    CREATE DATABASE [BazaDanychSteam]
END
GO

--usuniecie tabeli jesli te istnieja

DROP TABLE IF EXISTS Produkty;
DROP TABLE IF EXISTS [Produkty w bibliotece];
DROP TABLE IF EXISTS Ceny;
DROP TABLE IF EXISTS Znajomi;
DROP TABLE IF EXISTS Grupy;

USE BazaDanychSteam
GO

begin

-- stworzenie tabeli produkty

create table Produkty (
id_produktu int primary key identity(1,1),
nazwaProduktu varchar(70) not null unique,
nazwaFirmy varchar(50) not null,
dataWydania date not null,
systemOsiagniec varchar(1),
liczbaOsiagniec int,
gatunek varchar(30) not null
);

-- stworzenie tabeli produkty w bibliotece

create table [Produkty w bibliotece](
id_produktu int PRIMARY KEY, FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu) ON DELETE CASCADE,
nazwaProduktu varchar(70) CONSTRAINT ref_nazwa REFERENCES Produkty(nazwaProduktu),
czasWGrze decimal(6,2) not null,
wykonaneOsiagniecia int
);

-- stworzenie tabeli ceny

create table Ceny(
id_produktu int PRIMARY KEY, FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu) ON DELETE CASCADE,
nazwaProduktu varchar(70) CONSTRAINT ref_nazwaproduktu REFERENCES Produkty(nazwaProduktu),
cenaBazowa money not null,
cenaNajnizsza money not null,
dataCenyNajnizszej date
);

-- stworzenie tabeli znajomi

create table Znajomi(
id_uzytkownika int PRIMARY KEY identity(1,1),
nazwaUzytkownika varchar(50) not null unique,
lvlUzytkownika int not null,
liczbaProduktow int not null,
ulubionyProdukt varchar(70) CONSTRAINT ref_nazwaulub REFERENCES Produkty(nazwaProduktu),
narodowosc varchar(50) not null
);

-- stworzenie tabeli grupy

create table Grupy(
id_grupy int PRIMARY KEY identity(1,1),
nazwaGrupy varchar(100) not null unique,
liczbaCzlonkow int not null,
znajomyWGrupie varchar(50) CONSTRAINT ref_nazwaznaj REFERENCES Znajomi(nazwaUzytkownika)
);

--input dla tabeli produkty 

INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Agents of Mayhem ', 'Deep Silver ', '2017-08-15 ', '1 ', '49 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Aperture Tag ', 'Odd Time Studios ', '2014-07-15 ', null, null, 'Puzzle ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Apex Legends ', 'Respawn Entertainment ', '2020-11-05 ', '1 ', '12 ', 'Battle Royale ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Aragami ', 'Lince Works ', '2016-10-04 ', '1 ', '51 ', 'Stealth ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('ArcheBlade ', 'CodeBush Games ', '2014-04-25 ', '1 ', '77 ', 'MOBA ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Arid ', 'Sad Viscacha Studio ', '2021-06-29 ', '1 ', '39 ', 'Survival ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('ARK: Survival Evolved ', 'Studio Vildcard ', '2017-08-27 ', '1 ', '32 ', 'Survival ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Batman: Arkham Asylum ', 'Rocksteady Studios ', '2010-03-26 ', '1 ', '47 ', 'Stealth ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Batman: Arkham City ', 'Rocksteady Studios ', '2012-09-07 ', '1 ', '64 ', 'Stealth ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Batman: Arkham Knight ', 'Rocksteady Studios ', '2015-06-23 ', '1 ', '113 ', 'Stealth ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Bayonetta ', 'PlatinumGames ', '2017-04-11 ', '1 ', '50 ', 'Hack and Slash ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Bitburner ', 'Fulcrum Games ', '2021-12-11 ', '1 ', '98 ', 'Automation ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Black Mesa ', 'Crowbar Collective ', '2020-03-06 ', '1 ', '50 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Blazing Chrome ', 'JoyMasher ', '2019-07-11 ', '1 ', '39 ', 'Action ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Bulletstorm ', 'People Can Fly ', '2017-04-07 ', '1 ', '60 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Call of Juarez ', 'Techland ', '2007-07-12 ', null, null, 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Call of Juarez: Bound in Blood ', 'Techland ', '2009-07-30 ', null, null, 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Call of Juarez: Gunslinger ', 'Techland ', '2013-03-22 ', '1 ', '26 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Counter-Strike: Global Offensive ', 'Valve ', '2012-08-21 ', '1 ', '167 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Counter-Strike: Source ', 'Valve ', '2001-01-20 ', '1 ', '147 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Cyber Hook ', 'Blazing Stick ', '2020-09-24 ', '1 ', '22 ', 'Parkour ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Danganronpa ', 'Spike Chunsoft ', '2016-02-18 ', '1 ', '38 ', 'Visual Novel ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Dishonored ', 'Arkane Studios ', '2012-10-12 ', '1 ', '80 ', 'Stealth ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Dont Starve Together ', 'Klei Entertainment ', '2016-04-21 ', null, null, 'Survival ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Doom ', 'id Software ', '2016-05-13 ', '1 ', '54 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Duke Nukem Forever ', 'Gearbox Software ', '2011-06-09 ', '1 ', '62 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Dying Light ', 'Techland ', '2015-01-26 ', '1 ', '78 ', 'Survival Horror ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('The Escapists ', 'Mouldy Toof Studios ', '2013-02-13 ', '1 ', '37 ', 'Strategy ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Eternal Senia ', 'Sanctum Games ', '2015-06-18 ', null, null, 'RPG ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Euro Truck Simulator 2 ', 'SCS Software ', '2012-10-18 ', '1 ', '82 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('The Forest ', 'Endnight Games ', '2018-04-30 ', '1 ', '45 ', 'Survival ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Generation Zero ', 'Systemic Reaction ', '2019-05-26 ', '1 ', '72 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Getting Over It ', 'Bennett Doffy ', '2017-12-06 ', '1 ', '3 ', 'Psychological Horror ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Ghostrunner ', 'One More Level ', '2020-10-27 ', '1 ', '45 ', 'Parkour ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Global Ops: Comando Libya ', 'Spectral Games ', '2011-12-26 ', '1 ', '24 ', 'TPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Grand Theft Auto III ', 'Rockstar Games ', '2002-05-21 ', null, null, 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Grand Theft Auto IV ', 'Rockstar Games ', '2009-03-24 ', '1 ', '55 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Grand Theft Auto: San Andreas ', 'Rockstar Games ', '2005-07-06 ', null, '0 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Grand Theft Auto V ', 'Rockstar Games ', '2015-05-13 ', '1 ', '77 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Grand Theft Auto: Vice City ', 'Rockstar Games ', '2003-05-13 ', null, '0 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Half-Life ', 'Valve ', '1998-11-08 ', null, '0 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Half-Life 2 ', 'Valve ', '2004-11-16 ', '1 ', '33 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Half-Life 2: Episode One ', 'Valve ', '2006-06-01 ', '1 ', '13 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Half-Life 2: Episode Two ', 'Valve ', '2007-10-10 ', '1 ', '23 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Half-Life: Blue Shift ', 'Valve ', '2001-07-01 ', null, null, 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Half-Life:  Opposing Force ', 'Gearbox Software ', '1999-11-01 ', null, null, 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Helltaker ', 'vanripper ', '2020-05-11 ', '1 ', '10 ', 'Puzzle ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Injustice: Gods Among Us ', 'NetherRealm Studios ', '2013-11-29 ', '1 ', '50 ', 'Fighting ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Just Cause ', 'Square Enix ', '2006-09-22 ', null, null, 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Just Cause 2 ', 'Square Enix ', '2010-05-23 ', '1 ', '50 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Just Cause 2: Multiplayer Mod ', 'Avalanche Studios ', '2013-12-16 ', '1 ', '20 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Just Cause 3 ', 'Square Enix ', '2015-12-01 ', '1 ', '66 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Left 4 Dead 2  ', 'Valve ', '2009-11-17 ', '1 ', '101 ', 'Survival Horror ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Life is Strange ', 'DONTNULLD Entertainment ', '2015-01-30 ', '1 ', '60 ', 'Adventure ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('METAL GEAR RISING: REVENGENCE ', 'Konami ', '2014-01-09 ', '1 ', '60 ', 'Hack and Slash ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Mirrors Edge ', 'DICE ', '2009-01-13 ', null, null, 'Parkour ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Mirrors Edge Catalist ', 'DICE ', '2016-06-07 ', '1 ', '49 ', 'Parkour ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Mortal Kombat X ', 'NetherRealm Studios ', '2015-04-14 ', '1 ', '73 ', 'Fighting ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Need for Speed Heat ', 'Electronic Arts ', '2019-11-08 ', '1 ', '42 ', 'Racing ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Paladins ', 'Evil Mojo Games ', '2018-05-08 ', '1 ', '58 ', 'Hero Shooter ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('PAYDAY The Heist ', 'OVERKILL Software ', '2011-10-20 ', '1 ', '56 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('PAYDAY 2 ', 'OVERKILL Software ', '2013-08-13 ', '1 ', '1302 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Portal ', 'Valve ', '2007-10-10 ', '1 ', '15 ', 'Puzzle ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Portal 2  ', 'Valve ', '2011-04-19 ', '1 ', '51 ', 'Puzzle ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('SCP: Secret Laboratory ', 'NULLrthwood Studios ', '2017-10-29 ', '1 ', '35 ', 'Horror ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Shadow Warrior ', 'Flying Wild Hog ', '2013-09-26 ', '1 ', '92 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Sleeping Dogs ', 'Square Enix ', '2014-10-08 ', '1 ', '59 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Slime Rancher ', 'MoNULLmi Park ', '2017-08-01 ', '1 ', '57 ', 'Adventure ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('The Stanley Parable ', 'Galactic Cafe ', '2013-10-17 ', '1 ', '10 ', 'Comedy ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('SUPERHOT ', 'SUPERHOT Team ', '2016-02-25 ', '1 ', '26 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Terraria ', 'Re-Logic ', '2011-05-16 ', '1 ', '115 ', 'Survival ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Titanfall 2  ', 'Respawn Entertainment ', '2016-10-28 ', '1 ', '50 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Tom Clancys Rainbow Six Siege ', 'Ubisoft ', '2015-12-01 ', null, null, 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Unturned ', 'Smartly Dressed Games ', '2017-07-07 ', '1 ', '67 ', 'Survival ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Batman: Arkham Origins ', 'WB Games Montreal ', '2013-10-25 ', '1 ', '12 ', 'Stealth ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('BioShock ', '2K ', '2007-08-21 ', null, '34 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Bright Memory ', 'FYQD-Studio ', '2020-05-25 ', '1 ', '54 ', 'Hack and Slash ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Call of Duty: Black Ops III ', 'Treyarch  ', '2015-11-06 ', '1 ', '10 ', 'FPS ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Chernobylite ', 'The Farm 51 ', '2021-07-28 ', '1 ', '34 ', 'Horror ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('CODE VEIN ', 'Bandai Namco Studios ', '2019-09-27 ', '1 ', '98 ', 'Souls-like ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Cuphead ', 'Studio MDHR Entertainment Inc. ', '2017-09-29 ', '1 ', '54 ', 'Platformer ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Cyberpunk 2077 ', 'CD PROJEKT RED ', '2020-12-10 ', '1 ', '20 ', 'Open world ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('DAEMON X MACHINA ', 'Marvelous Inc. ', '2020-02-13 ', '1 ', '6 ', 'Mechs ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Danganronpa 2: Goodbye Despair ', 'Spike Chunsoft ', '2016-04-19 ', '1 ', '74 ', 'Visual Novel ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Devil May Cry 5 ', 'CAPCOM ', '2019-05-08 ', '1 ', '6 ', 'Hack and Slash ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Factorio ', 'Wube Software ', '2020-08-14 ', '1 ', '65 ', 'Automation ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('Milk outside a bag of milk outside a bag of milk ', 'Nikita Kryukov ', '2021-12-16 ', '1 ', '32 ', 'Psychological Horror ');
INSERT INTO Produkty (nazwaProduktu , nazwaFirmy , dataWydania , systemOsiagniec , liczbaOsiagniec , gatunek ) VALUES ('NieR:Automata ', 'Square Enix ', '2017-05-17 ', '1 ', '55 ', 'Hack and Slash ');

--input dla tabeli produkty w bibliotece

INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('3', 'Apex Legends', '77.4', '12');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('4', 'Aragami', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('5', 'ArcheBlade', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('6', 'Arid', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('7', 'ARK: Survival Evolved', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('8', 'Batman: Arkham Asylum', '44.2', '47');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('9', 'Batman: Arkham City', '134.85', '63');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('10', 'Batman: Arkham Knight', '148.3', '89');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('11', 'Bayonetta', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('12', 'Bitburner', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('13', 'Black Mesa', '49', '50');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('14', 'Blazing Chrome', '12.1', '16');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('15', 'Bulletstorm', '3', '1');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('16', 'Call of Juarez', '0', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('17', 'Call of Juarez: Bound in Blood', '0', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('18', 'Call of Juarez: Gunslinger', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('19', 'Counter-Strike: Global Offensive', '1824.9', '167');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('20', 'Counter-Strike: Source', '25', '92');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('21', 'Cyber Hook', '16', '22');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('22', 'Danganronpa', '2.2', '2');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('23', 'Dishonored', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('24', 'Dont Starve Together', '7', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('25', 'Doom', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('26', 'Duke Nukem Forever', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('27', 'Dying Light', '3', '5');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('28', 'The Escapists', '17', '9');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('29', 'Eternal Senia', '0', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('30', 'Euro Truck Simulator 2', '30.5', '8');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('31', 'The Forest', '1', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('32', 'Generation Zero', '3', '7');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('33', 'Getting Over It', '72', '3');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('34', 'Ghostrunner', '20', '34');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('35', 'Global Ops: Comando Libya', '8', '24');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('36', 'Grand Theft Auto III', '18.9', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('37', 'Grand Theft Auto IV', '58', '30');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('38', 'Grand Theft Auto: San Andreas', '112', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('39', 'Grand Theft Auto V', '619.12', '77');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('40', 'Grand Theft Auto: Vice City', '98', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('41', 'Half-Life', '134', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('42', 'Half-Life 2', '24', '33');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('43', 'Half-Life 2: Episode One', '18', '13');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('44', 'Half-Life 2: Episode Two', '15', '23');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('45', 'Half-Life: Blue Shift', '3', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('46', 'Half-Life:  Opposing Force', '7', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('47', 'Helltaker', '4', '10');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('48', 'Injustice: Gods Among Us', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('49', 'Just Cause', '32', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('50', 'Just Cause 2', '193', '50');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('51', 'Just Cause 2: Multiplayer Mod', '817', '20');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('52', 'Just Cause 3', '11', '15');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('53', 'Left 4 Dead 2 ', '9', '5');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('54', 'Life is Strange', '8', '10');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('55', 'METAL GEAR RISING: REVENGENCE', '137.6', '29');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('56', 'Mirrors Edge', '49', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('57', 'Mirrors Edge Catalist', '5', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('58', 'Mortal Kombat X', '5', '7');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('59', 'Need for Speed Heat', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('60', 'Paladins', '98', '47');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('61', 'PAYDAY The Heist', '1', '1');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('62', 'PAYDAY 2', '43', '1547');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('63', 'Portal', '40', '15');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('64', 'Portal 2 ', '32', '51');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('65', 'SCP: Secret Laboratory', '755.32', '35');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('66', 'Shadow Warrior', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('67', 'Sleeping Dogs', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('68', 'Slime Rancher', '11', '3');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('69', 'The Stanley Parable', '9', '8');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('70', 'SUPERHOT', '30', '26');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('71', 'Terraria', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('72', 'Titanfall 2 ', '0', '0');
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('73', 'Tom Clancys Rainbow Six Siege', '51', NULL);
INSERT INTO [Produkty w bibliotece] (id_produktu, nazwaProduktu, czasWGrze, wykonaneOsiagniecia) VALUES ('74', 'Unturned', '59', '20');

--input dla tabeli ceny

INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('1', 'Agents of Mayhem', '107.99', '29.00', '2020-04-15');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('2', 'Aperture Tag', '51.99', '21.00', '2015-04-12');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('3', 'Apex Legends', '0.00', '0.00', '2020-11-05');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('4', 'Aragami', '71.99', '29.00', '2016-10-04');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('5', 'ArcheBlade', '0.00', '0.00', '2016-03-25');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('6', 'Arid', '0.00', '0.00', '2022-06-29');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('7', 'ARK: Survival Evolved', '71.99', '0.00', '2018-08-27');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('8', 'Batman: Arkham Asylum', '71.99', '14.39', '2011-03-26');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('9', 'Batman: Arkham City', '71.99', '17.99', '2012-09-07');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('10', 'Batman: Arkham Knight', '71.99', '17.99', '2015-06-23');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('11', 'Bayonetta', '89.00', '21.49', '2018-05-11');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('12', 'Bitburner', '0.00', '0.00', '2022-12-01');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('13', 'Black Mesa', '71.99', '17.99', '2020-04-05');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('14', 'Blazing Chrome', '60.99', '17.99', '2019-07-11');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('15', 'Bulletstorm', '142.99', '14.29', '2017-04-07');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('16', 'Call of Juarez', '39.9', '15.00', '2007-07-12');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('17', 'Call of Juarez: Bound in Blood', '39.9', '15.00', '2009-07-30');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('18', 'Call of Juarez: Gunslinger', '49.99', '17.99', '2013-03-22');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('19', 'Counter-Strike: Global Offensive', '0.00', '0.00', '2012-08-21');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('20', 'Counter-Strike: Source', '45.99', '21.00', '2001-01-20');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('21', 'Cyber Hook', '53.99', '13.49', '2020-09-24');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('22', 'Danganronpa', '71.99', '44.00', '2016-02-18');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('23', 'Dishonored', '44.99', '36.00', '2012-10-12');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('24', 'Dont Starve Together', '53.99', '17.99', '2016-04-21');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('25', 'Doom', '79.99', '21.99', '2016-05-13');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('26', 'Duke Nukem Forever', '85.9', '32.00', '2011-06-09');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('27', 'Dying Light', '89.99', '24.99', '2015-01-26');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('28', 'The Escapists', '64.99', '17.99', '2013-02-13');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('29', 'Eternal Senia', '0.00', '0.00', '2015-06-18');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('30', 'Euro Truck Simulator 2', '79.99', '17.99', '2012-10-18');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('31', 'The Forest', '71.99', '21.29', '2018-04-30');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('32', 'Generation Zero', '99.99', '31.98', '2019-05-26');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('33', 'Getting Over It', '28.99', '34.00', '2017-12-06');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('34', 'Ghostrunner', '124.00', '62.5', '2020-10-27');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('35', 'Global Ops: Comando Libya', '17.99', '0.99', '2011-12-26');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('36', 'Grand Theft Auto III', '17.99', '17.99', '2002-05-21');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('37', 'Grand Theft Auto IV', '84.9', '17.99', '2009-03-24');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('38', 'Grand Theft Auto: San Andreas', '17.99', '17.99', '2005-07-06');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('39', 'Grand Theft Auto V', '103.68', '51.95', '2015-05-13');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('40', 'Grand Theft Auto: Vice City', '17.99', '17.99', '2003-05-13');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('41', 'Half-Life', '25.99', '25.00', '1998-11-08');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('42', 'Half-Life 2', '45.99', '21.23', '2004-11-16');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('43', 'Half-Life 2: Episode One', '36.99', '17.99', '2006-06-01');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('44', 'Half-Life 2: Episode Two', '28.99', '17.99', '2007-10-10');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('45', 'Half-Life: Blue Shift', '25.00', '17.99', '2005-07-01');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('46', 'Half-Life:  Opposing Force', '25.00', '17.99', '1999-11-01');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('47', 'Helltaker', '0.00', '0.00', '2020-05-11');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('48', 'Injustice: Gods Among Us', '71.99', '21.99', '2013-11-29');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('49', 'Just Cause', '25.49', '18.00', '2006-09-22');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('50', 'Just Cause 2', '53.99', '21.00', '2010-05-23');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('51', 'Just Cause 2: Multiplayer Mod', '0.00', '0.00', '2013-12-16');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('52', 'Just Cause 3', '74.00', '21.95', '2015-12-01');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('53', 'Left 4 Dead 2 ', '45.99', '33.00', '2009-11-17');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('54', 'Life is Strange', '71.99', '21.99', '2015-01-30');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('55', 'METAL GEAR RISING: REVENGENCE', '109.00', '49.5', '2014-01-09');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('56', 'Mirrors Edge', '69.9', '21.99', '2009-01-13');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('57', 'Mirrors Edge Catalist', '69.6', '21.99', '2017-06-07');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('58', 'Mortal Kombat X', '71.99', '21.99', '2015-04-14');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('59', 'Need for Speed Heat', '289.9', '15.43', '2019-11-08');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('60', 'Paladins', '0.00', '0.00', '2018-05-08');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('61', 'PAYDAY The Heist', '53.99', '34.00', '2011-10-20');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('62', 'PAYDAY 2', '35.99', '15.00', '2013-08-13');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('63', 'Portal', '45.99', '43.00', '2007-10-10');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('64', 'Portal 2 ', '45.99', '13.33', '2011-04-19');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('65', 'SCP: Secret Laboratory', '0.00', '0.00', '2017-10-29');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('66', 'Shadow Warrior', '35.99', '15.43', '2013-09-26');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('67', 'Sleeping Dogs', '75.00', '15.43', '2014-10-08');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('68', 'Slime Rancher', '71.99', '15.43', '2017-08-01');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('69', 'The Stanley Parable', '53.99', '15.43', '2013-10-17');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('70', 'SUPERHOT', '29.99', '29.99', '2018-02-25');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('71', 'Terraria', '25.99', '15.65', '2011-05-16');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('72', 'Titanfall 2 ', '119.9', '21.99', '2016-10-28');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('73', 'Tom Clancys Rainbow Six Siege', '79.9', '53.13', '2015-12-01');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('74', 'Unturned', '0.00', '0.00', '2017-07-07');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('75', 'Batman: Arkham Origins', '71.99', '17.99', '2022-05-04');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('76', 'BioShock', '85.99', '17.99', '2022-05-05');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('77', 'Bright Memory', '28.99', '17.99', '2022-05-06');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('78', 'Call of Duty: Black Ops III', '61.55', '17.99', '2022-05-07');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('79', 'Chernobylite', '119.99', '119.99', '2022-05-08');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('80', 'CODE VEIN', '109.00', '109.00', '2022-05-09');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('81', 'Cuphead', '71.99', '17.99', '2022-05-10');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('82', 'Cyberpunk 2077', '199.00', '130.00', '2022-05-11');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('83', 'DAEMON X MACHINA', '179.99', '56.98', '2022-05-12');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('84', 'Danganronpa 2: Goodbye Despair', '71.99', '17.99', '2022-05-13');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('85', 'Devil May Cry 5', '120.00', '54.65', '2022-05-14');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('86', 'Factorio', '120.00', '54.65', '2022-05-15');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('87', 'Milk outside a bag of milk outside a bag of milk', '32.99', '27.00', '2022-05-16');
INSERT INTO Ceny (id_produktu, nazwaProduktu, cenaBazowa, cenaNajnizsza, dataCenyNajnizszej) VALUES ('88', 'NieR:Automata', '142.99', '54.65', '2022-05-17');

--input dla tabeli znajomi

INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('Tomkers77', '70', '34', 'Euro Truck Simulator 2', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('algida', '1', '52', 'Counter-Strike: Global Offensive', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('aquerkus', '2', '3', 'Counter-Strike: Global Offensive', 'USA');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('FURGERBLIPPER68', '30', '3', 'Portal', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('CIDIK', '55', '2', 'Slime Rancher', 'France');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('halkoii', '1', '1', 'Portal 2', 'USA');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('hejc', '1', '0', 'Left 4 Dead 2', 'USA');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('junkiel', '1', '2', 'Counter-Strike: Global Offensive', 'Zimbabwe');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('lebii', '2', '12', 'The Forest', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('maciejkaa1', '1', '43', 'Half-Life', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('DAJMER', '30', '453', 'Counter-Strike: Global Offensive', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('mar', '13', '103', 'Dying Light', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('niks', '1', '4', 'Life is Strange', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('olville', '3', '3', 'Call of Duty: Black Ops III', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('onom', '1', '4', 'Doom', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('peki', '434', '25', 'Counter-Strike: Global Offensive', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('peki2', '3', '33', 'Eternal Senia', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('piarek', '1', '3', 'Life is Strange', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('PiarKO', '4', '43', 'Call of Duty: Black Ops III', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('pi¿mojez', '54', '3', 'Generation Zero', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('Mongolodi', '3', '0', 'Half-Life', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('riskie', '45', '0', 'Counter-Strike: Global Offensive', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('RPHunter', '4', '7', 'Half-Life', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('Stalker111PL', '4', '42', 'SUPERHOT', 'Poland');
INSERT INTO Znajomi (nazwaUzytkownika, lvlUzytkownika, liczbaProduktow, ulubionyProdukt, narodowosc) VALUES ('sel', '1', '2', 'Counter-Strike: Global Offensive', 'Poland');

--input dla tabeli grupy

INSERT INTO Grupy (nazwaGrupy, liczbaCzlonkow, znajomyWGrupie) VALUES ('Clan Warfare Achievement Group', '1919', 'maciejkaa1');
INSERT INTO Grupy (nazwaGrupy, liczbaCzlonkow, znajomyWGrupie) VALUES ('Turystyka ', '8', 'peki');
INSERT INTO Grupy (nazwaGrupy, liczbaCzlonkow, znajomyWGrupie) VALUES ('CS:GO Players', '23343', 'PiarKO');
INSERT INTO Grupy (nazwaGrupy, liczbaCzlonkow, znajomyWGrupie) VALUES ('Steam Giveaways ', '156335', 'PiarKO');
INSERT INTO Grupy (nazwaGrupy, liczbaCzlonkow, znajomyWGrupie) VALUES ('Portal Speedrunning Community', '8982', 'Tomkers77');
END

-- koniec