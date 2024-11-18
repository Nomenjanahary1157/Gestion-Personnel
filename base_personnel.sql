CREATE DATABASE gestion_personnel;
\c gestion_personnel;

CREATE TABLE fonction (
    id SERIAL PRIMARY KEY,
    nom_fonction VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE corps (
    id SERIAL PRIMARY KEY,
    nom_corps VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE fonction (
    id SERIAL PRIMARY KEY,
    nom_fonction VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE qualification (
    id SERIAL PRIMARY KEY,
    nom_qualification VARCHAR(200) ,
    domaine VARCHAR(200) 
);

CREATE TABLE direction (
    id SERIAL PRIMARY KEY,
    nom_direction VARCHAR(200) 
);

CREATE TABLE personnel (
    id SERIAL PRIMARY KEY,
    nom_personnel VARCHAR(200) 
);

CREATE TABLE position (
    id SERIAL PRIMARY KEY,
    nom_position VARCHAR(200) 
);

CREATE TABLE personne (
    id SERIAL PRIMARY KEY,
    nom_prenoms VARCHAR(255) NOT NULL,
    numéro INT,
    mail VARCHAR(50),
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


CREATE TABLE reclassement (
    id SERIAL PRIMARY KEY,
    idPosition INT REFERENCES position(id) ON DELETE SET NULL,
    idPersonnel INT REFERENCES personnel(id) ON DELETE SET NULL
    motif TEXT,
    commentaire TEXT,
    status VARCHAR(50),
);

CREATE TABLE integration (
    id SERIAL PRIMARY KEY,
    date_effet DATE,
    CE VARCHAR(5),
    idPersonne INT REFERENCES personne(id) ON DELETE SET NULL
);

CREATE TABLE detachement (
    id SERIAL PRIMARY KEY,
    idPosition INT REFERENCES position(id) ON DELETE SET NULL,
    idPersonnel INT REFERENCES personnel(id) ON DELETE SET NULL
);

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
INSERT INTO personne (nom_prenoms, numéro, mail, im, idfonction, idcorps, idQualification, idDirection, idPersonnel, idPosition, photo, cin, date_entree, date_naissance, sexe) VALUES 
('Alice Martin', 101, 'alice.martin@example.com', 'IM001', 1, 1, 2, 1, 1, 1, 'photo1.jpg', '123456789001', '2020-01-15', '1990-05-25', 'F'),
('Bob Dupuis', 102, 'bob.dupuis@example.com', 'IM002', 2, 2, 3, 2, 2, 2, 'photo2.jpg', '123456789002', '2019-03-20', '1985-07-18', 'M'),
('Clara Moreau', 103, 'clara.moreau@example.com', 'IM003', 3, 3, 1, 3, 3, 3, 'photo3.jpg', '123456789003', '2021-06-10', '1992-12-03', 'F'),
('David Roche', 104, 'david.roche@example.com', 'IM004', 4, 4, 5, 4, 4, 4, 'photo4.jpg', '123456789004', '2022-09-01', '1988-11-22', 'M'),
('Emma Leblanc', 105, 'emma.leblanc@example.com', 'IM005', 5, 5, 4, 5, 5, 5, 'photo5.jpg', '123456789005', '2018-07-30', '1995-01-14', 'F');

-- Table: reclassement
INSERT INTO reclassement (idPosition, idPersonnel, motif, commentaire, status) VALUES 
(2, 1, 'Promotion', 'Nouveau poste en gestion', 'Validé'),
(3, 2, 'Changement de département', 'Affecté à la Direction Technique', 'Validé'),
(4, 3, 'Réorganisation', 'Poste déplacé', 'En cours'),
(5, 4, 'Transfert', 'Nouvelle affectation', 'Validé'),
(1, 5, 'Retour', 'Revenu de détachement', 'Validé');

-- Table: integration
INSERT INTO integration (date_effet, CE, idPersonne) VALUES 
('2023-01-01', 'CE1', 1),
('2023-02-15', 'CE2', 2),
('2023-03-10', 'CE3', 3),
('2023-04-20', 'CE4', 4),
('2023-05-30', 'CE5', 5);

-- Table: detachement
INSERT INTO detachement (idPosition, idPersonnel) VALUES 
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5);

-- Table: migration
INSERT INTO migration (date_migration, id_direction_depart, id_direction_arrivee, id_fonction_depart, id_fonction_arrivee, id_personnel_depart, id_personnel_arrivee, id_personne) VALUES 
('2024-01-01', 1, 2, 1, 2, 1, 2, 1),
('2024-02-15', 3, 4, 3, 4, 3, 4, 2),
('2024-03-10', 2, 1, 2, 1, 2, 1, 3),
('2024-04-20', 5, 3, 5, 3, 5, 3, 4),
('2024-05-30', 4, 5, 4, 5, 4, 5, 5);

-- Table: historique_personne
INSERT INTO historique_personne (id_personne, id_fonction, id_direction, date_debut, date_fin, motif, autres_infos) VALUES 
(1, 1, 1, '2020-01-15', '2023-01-01', 'Mutation', 'Nouveau rôle en gestion'),
(2, 2, 2, '2019-03-20', '2023-02-15', 'Promotion', 'Amélioration des performances'),
(3, 3, 3, '2021-06-10', '2023-03-10', 'Transfert', 'Changement de domaine'),
(4, 4, 4, '2022-09-01', '2023-04-20', 'Réorganisation', 'Poste optimisé'),
(5, 5, 5, '2018-07-30', '2023-05-30', 'Retour', 'Revenu après détachement');
