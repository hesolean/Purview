-- Script SQL pour remplir une base de données Azure SQL pour un centre de formation Novo avec des tables classifiées

-- Classe Client
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100),
    Prenom NVARCHAR(100),
    Email NVARCHAR(100),
    Telephone NVARCHAR(15),
    DateInscription DATE
);

CREATE TABLE ClientDetails (
    ClientDetailID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT FOREIGN KEY REFERENCES Clients(ClientID),
    Adresse NVARCHAR(255),
    Ville NVARCHAR(100),
    CodePostal NVARCHAR(10),
    Pays NVARCHAR(50)
);

-- Classe Achat
CREATE TABLE Achats (
    AchatID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT FOREIGN KEY REFERENCES Clients(ClientID),
    Montant DECIMAL(10, 2),
    DateAchat DATE
);

CREATE TABLE Factures (
    FactureID INT PRIMARY KEY IDENTITY(1,1),
    AchatID INT FOREIGN KEY REFERENCES Achats(AchatID),
    NumeroFacture NVARCHAR(50),
    DateFacture DATE,
    TotalTTC DECIMAL(10, 2)
);

-- Classe Partenaire
CREATE TABLE Partenaires (
    PartenaireID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100),
    SecteurActivite NVARCHAR(100),
    ContactPrincipal NVARCHAR(100),
    Telephone NVARCHAR(15),
    Email NVARCHAR(100)
);

CREATE TABLE Contrats (
    ContratID INT PRIMARY KEY IDENTITY(1,1),
    PartenaireID INT FOREIGN KEY REFERENCES Partenaires(PartenaireID),
    DateDebut DATE,
    DateFin DATE,
    ValeurContrat DECIMAL(10, 2)
);

-- Classe Marketing
CREATE TABLE CampagnesMarketing (
    CampagneID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100),
    DateLancement DATE,
    Budget DECIMAL(10, 2),
    Canal NVARCHAR(50)
);

CREATE TABLE ResultatsCampagnes (
    ResultatID INT PRIMARY KEY IDENTITY(1,1),
    CampagneID INT FOREIGN KEY REFERENCES CampagnesMarketing(CampagneID),
    NombreVues INT,
    NombreClics INT,
    Conversion DECIMAL(5, 2)
);

-- Insertion de données fictives

-- Table Clients
INSERT INTO Clients (Nom, Prenom, Email, Telephone, DateInscription) VALUES
('Dupont', 'Marie', 'marie.dupont@example.com', '0601234567', '2024-01-15'),
('Durand', 'Paul', 'paul.durand@example.com', '0612345678', '2024-01-20'),
('Moreau', 'Claire', 'claire.moreau@example.com', '0623456789', '2024-02-10'),
('Martin', 'Luc', 'luc.martin@example.com', '0634567890', '2024-02-15'),
('Bernard', 'Sophie', 'sophie.bernard@example.com', '0645678901', '2024-02-18'),
('Roux', 'Pierre', 'pierre.roux@example.com', '0656789012', '2024-02-22'),
('Morel', 'Julie', 'julie.morel@example.com', '0667890123', '2024-03-01'),
('Fournier', 'Thomas', 'thomas.fournier@example.com', '0678901234', '2024-03-05'),
('Girard', 'Laura', 'laura.girard@example.com', '0689012345', '2024-03-10'),
('Lemoine', 'David', 'david.lemoine@example.com', '0690123456', '2024-03-15');

-- Table ClientDetails
INSERT INTO ClientDetails (ClientID, Adresse, Ville, CodePostal, Pays) VALUES
(1, '10 rue de Paris', 'Paris', '75001', 'France'),
(2, '15 avenue des Champs', 'Lyon', '69001', 'France'),
(3, '20 place Bellecour', 'Marseille', '13001', 'France'),
(4, '5 boulevard Haussmann', 'Toulouse', '31000', 'France'),
(5, '12 chemin Vert', 'Nice', '06000', 'France'),
(6, '7 allée des Acacias', 'Bordeaux', '33000', 'France'),
(7, '3 rue du Bac', 'Nantes', '44000', 'France'),
(8, '25 impasse des Lilas', 'Lille', '59000', 'France'),
(9, '8 square Victor Hugo', 'Strasbourg', '67000', 'France'),
(10, '6 quai de Seine', 'Rouen', '76000', 'France');

-- Table Achats
INSERT INTO Achats (ClientID, Montant, DateAchat) VALUES
(1, 150.00, '2024-01-16'),
(2, 200.00, '2024-01-21'),
(3, 300.00, '2024-02-11'),
(4, 400.00, '2024-02-16'),
(5, 500.00, '2024-02-19'),
(6, 600.00, '2024-02-23'),
(7, 700.00, '2024-03-02'),
(8, 800.00, '2024-03-06'),
(9, 900.00, '2024-03-11'),
(10, 1000.00, '2024-03-16');

-- Table Factures
INSERT INTO Factures (AchatID, NumeroFacture, DateFacture, TotalTTC) VALUES
(1, 'F-2024001', '2024-01-17', 180.00),
(2, 'F-2024002', '2024-01-22', 240.00),
(3, 'F-2024003', '2024-02-12', 360.00),
(4, 'F-2024004', '2024-02-17', 480.00),
(5, 'F-2024005', '2024-02-20', 600.00),
(6, 'F-2024006', '2024-02-24', 720.00),
(7, 'F-2024007', '2024-03-03', 840.00),
(8, 'F-2024008', '2024-03-07', 960.00),
(9, 'F-2024009', '2024-03-12', 1080.00),
(10, 'F-2024010', '2024-03-17', 1200.00);

-- Table Partenaires
INSERT INTO Partenaires (Nom, SecteurActivite, ContactPrincipal, Telephone, Email) VALUES
('Partenaire A', 'Informatique', 'Alice Dupont', '0102030405', 'alice@partenairea.com'),
('Partenaire B', 'Marketing', 'Bob Martin', '0203040506', 'bob@partenaireb.com'),
('Partenaire C', 'Formation', 'Charlie Moreau', '0304050607', 'charlie@partenairec.com'),
('Partenaire D', 'Conseil', 'David Bernard', '0405060708', 'david@partenaired.com'),
('Partenaire E', 'Finance', 'Emma Roux', '0506070809', 'emma@partenairee.com'),
('Partenaire F', 'Santé', 'Fiona Morel', '0607080910', 'fiona@partenairef.com'),
('Partenaire G', 'Education', 'George Fournier', '0708091011', 'george@partenaireg.com'),
('Partenaire H', 'Transport', 'Hector Girard', '0809101112', 'hector@partenaireh.com'),
('Partenaire I', 'Commerce', 'Isabelle Lemoine', '0910111213', 'isabelle@partenairei.com'),
('Partenaire J', 'Logistique', 'Jacques Joly', '1011121314', 'jacques@partenairej.com');

-- Table Contrats
INSERT INTO Contrats (PartenaireID, DateDebut, DateFin, ValeurContrat) VALUES
(1, '2024-01-01', '2024-12-31', 10000.00),
(2, '2024-02-01', '2024-08-31', 15000.00),
(3, '2024-03-01', '2024-09-30', 20000.00),
(4, '2024-04-01', '2025-03-31', 25000.00),
(5, '2024-05-01', '2024-11-30', 30000.00),
(6, '2024-06-01', '2024-12-31', 35000.00),
(7, '2024-07-01', '2025-06-30', 40000.00),
(8, '2024-08-01', '2025-01-31', 45000.00),
(9, '2024-09-01', '2025-08-31', 50000.00),
(10, '2024-10-01', '2025-09-30', 55000.00);

-- Table CampagnesMarketing
INSERT INTO CampagnesMarketing (Nom, DateLancement, Budget, Canal) VALUES
('SEO Campagne', '2024-01-01', 5000.00, 'SEO'),
('Social Media Push', '2024-02-01', 7000.00, 'Social Media'),
('Email Blast', '2024-03-01', 3000.00, 'Email'),
('Web Ads', '2024-04-01', 8000.00, 'Web'),
('TV Campaign', '2024-05-01', 10000.00, 'Television'),
('Radio Spots', '2024-06-01', 4000.00, 'Radio'),
('Content Marketing', '2024-07-01', 2000.00, 'Content'),
('Influencer Outreach', '2024-08-01', 6000.00, 'Influencers'),
('Affiliate Program', '2024-09-01', 5000.00, 'Affiliate'),
('Print Ads', '2024-10-01', 3000.00, 'Print');

-- Table ResultatsCampagnes
INSERT INTO ResultatsCampagnes (CampagneID, NombreVues, NombreClics, Conversion) VALUES
(1, 100000, 5000, 5.00),
(2, 150000, 7000, 4.67),
(3, 80000, 3000, 3.75),
(4, 200000, 8000, 4.00),
(5, 500000, 10000, 2.00),
(6, 120000, 4000, 3.33),
(7, 50000, 2500, 5.00),
(8, 70000, 6000, 8.57),
(9, 90000, 4500, 5.00),
(10, 60000, 3000, 5.00);
