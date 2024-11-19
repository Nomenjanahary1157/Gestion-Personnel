-- Création de la base de données
CREATE DATABASE gestion_personnel;
\c gestion_personnel;

-- Table: fonction
CREATE TABLE fonction (
    id SERIAL PRIMARY KEY,
    nom_fonction VARCHAR(255) UNIQUE NOT NULL
);

-- Table: corps
CREATE TABLE corps (
    id SERIAL PRIMARY KEY,
    nom_corps VARCHAR(255) UNIQUE NOT NULL
);

-- Table: qualification
CREATE TABLE qualification (
    id SERIAL PRIMARY KEY,
    nom_qualification VARCHAR(200),
    domaine VARCHAR(200)
);

-- Table: direction
CREATE TABLE direction (
    id SERIAL PRIMARY KEY,
    nom_direction VARCHAR(200)
);

-- Table: personnel
CREATE TABLE personnel (
    id SERIAL PRIMARY KEY,
    nom_personnel VARCHAR(200)
);

-- Table: position
CREATE TABLE position (
    id SERIAL PRIMARY KEY,
    nom_position VARCHAR(200)
);

-- Table: personne
CREATE TABLE personne (
    id SERIAL PRIMARY KEY,
    nom_prenoms VARCHAR(255) NOT NULL,
    numéro INT,
    mail VARCHAR(50),
    login VARCHAR(50) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    im VARCHAR(50) UNIQUE,
    idfonction INT REFERENCES fonction(id) ON DELETE SET NULL,
    idcorps INT REFERENCES corps(id) ON DELETE SET NULL,
    idQualification INT REFERENCES qualification(id) ON DELETE SET NULL,
    idDirection INT REFERENCES direction(id) ON DELETE SET NULL,
    idPersonnel INT REFERENCES personnel(id) ON DELETE SET NULL,
    idPosition INT REFERENCES position(id) ON DELETE SET NULL,
    photo VARCHAR(200),
    cin VARCHAR(50) UNIQUE,
    date_entree DATE,
    date_naissance DATE,
    sexe CHAR(1)
);

-- Table: reclassement
CREATE TABLE reclassement (
    id SERIAL PRIMARY KEY,
    idPosition INT REFERENCES position(id) ON DELETE SET NULL,
    idPersonnel INT REFERENCES personnel(id) ON DELETE SET NULL,
    motif TEXT,
    commentaire TEXT,
    status VARCHAR(50)
);

-- Table: integration
CREATE TABLE integration (
    id SERIAL PRIMARY KEY,
    date_effet DATE,
    CE VARCHAR(5),
    idPersonne INT REFERENCES personne(id) ON DELETE SET NULL
);

-- Table: detachement
CREATE TABLE detachement (
    id SERIAL PRIMARY KEY,
    idPosition INT REFERENCES position(id) ON DELETE SET NULL,
    idPersonnel INT REFERENCES personnel(id) ON DELETE SET NULL
);

-- Table: migration
CREATE TABLE migration (
    id SERIAL PRIMARY KEY,
    date_migration DATE,
    id_direction_depart INT REFERENCES direction(id) ON DELETE SET NULL,
    id_direction_arrivee INT REFERENCES direction(id) ON DELETE SET NULL,
    id_fonction_depart INT REFERENCES fonction(id) ON DELETE SET NULL,
    id_fonction_arrivee INT REFERENCES fonction(id) ON DELETE SET NULL,
    id_personnel_depart INT REFERENCES personnel(id) ON DELETE SET NULL,
    id_personnel_arrivee INT REFERENCES personnel(id) ON DELETE SET NULL,
    id_personne INT REFERENCES personne(id) ON DELETE SET NULL
);

-- Table: historique_personne
CREATE TABLE historique_personne (
    id SERIAL PRIMARY KEY,
    id_personne INT REFERENCES personne(id) ON DELETE CASCADE,
    id_fonction INT REFERENCES fonction(id) ON DELETE SET NULL,
    id_direction INT REFERENCES direction(id) ON DELETE SET NULL,
    date_debut DATE NOT NULL,
    date_fin DATE,
    motif VARCHAR(255), 
    autres_infos TEXT
);

-- Insertion des données initiales
-- Table: fonction
INSERT INTO fonction (nom_fonction) VALUES 
('Responsable RH'),
('Analyste'),
('Développeur'),
('Technicien'),
('Chef de Projet');

-- Table: corps
INSERT INTO corps (nom_corps) VALUES 
('Corps Administratif'),
('Corps Technique'),
('Corps Enseignant'),
('Corps Médical'),
('Corps Juridique');

-- Table: qualification
INSERT INTO qualification (nom_qualification, domaine) VALUES 
('Licence', 'Informatique'),
('Master', 'Gestion des Ressources Humaines'),
('Doctorat', 'Sciences Politiques'),
('BTS', 'Électronique'),
('Certification', 'Développement Web');

-- Table: direction
INSERT INTO direction (nom_direction) VALUES 
('Direction Générale'),
('Direction Technique'),
('Direction Financière'),
('Direction Commerciale'),
('Direction Juridique');

-- Table: personnel
INSERT INTO personnel (nom_personnel) VALUES 
('Jean Dupont'),
('Marie Curie'),
('Albert Einstein'),
('Isaac Newton'),
('Ada Lovelace');

-- Table: position
INSERT INTO position (nom_position) VALUES 
('Actif'),
('Suspendu'),
('En mission'),
('Détaché'),
('Retraité');

-- Table: personne
INSERT INTO personne (nom_prenoms, numéro, mail, login, mot_de_passe, im, idfonction, idcorps, idQualification, idDirection, idPersonnel, idPosition, photo, cin, date_entree, date_naissance, sexe) VALUES 
('Alice Martin', 101, 'alice.martin@example.com', 'alice.martin', 'securepass1', 'IM001', 1, 1, 2, 1, 1, 1, 'photo1.jpg', '123456789001', '2020-01-15', '1990-05-25', 'F'),
('Bob Dupuis', 102, 'bob.dupuis@example.com', 'bob.dupuis', 'securepass2', 'IM002', 2, 2, 3, 2, 2, 2, 'photo2.jpg', '123456789002', '2019-03-20', '1985-07-18', 'M'),
('Clara Moreau', 103, 'clara.moreau@example.com', 'clara.moreau', 'securepass3', 'IM003', 3, 3, 1, 3, 3, 3, 'photo3.jpg', '123456789003', '2021-06-10', '1992-12-03', 'F'),
('David Roche', 104, 'david.roche@example.com', 'david.roche', 'securepass4', 'IM004', 4, 4, 5, 4, 4, 4, 'photo4.jpg', '123456789004', '2022-09-01', '1988-11-22', 'M'),
('Emma Leblanc', 105, 'emma.leblanc@example.com', 'emma.leblanc', 'securepass5', 'IM005', 5, 5, 4, 5, 5, 5, 'photo5.jpg', '123456789005', '2018-07-30', '1995-01-14', 'F');
