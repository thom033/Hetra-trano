CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE type_tafo (
    id_type_tafo SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    coefficient NUMERIC
);

CREATE TABLE type_rindrina (
    id_type_rindrina SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    coefficient NUMERIC
);

CREATE TABLE maison (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    longeur NUMERIC,
    largeur NUMERIC,
    nbr_etage NUMERIC,
    position GEOMETRY
);

CREATE TABLE maison_detaills (
    id_maison_detaills SERIAL PRIMARY KEY,
    id_maison INTEGER,
    id_type_rindrina INTEGER,
    id_type_tafo INTEGER,
    FOREIGN KEY (id_maison) REFERENCES maison(id),
    FOREIGN KEY (id_type_rindrina) REFERENCES type_rindrina(id_type_rindrina),
    FOREIGN KEY (id_type_tafo) REFERENCES type_tafo(id_type_tafo)
);

CREATE TABLE arrondissement (
    id_arrondissement SERIAL PRIMARY KEY,
    nom VARCHAR(100)
);

CREATE TABLE arrondissement_position (
    id_arrondissement_position SERIAL PRIMARY KEY,
    id_arrondissement INTEGER,
    position GEOMETRY,
    FOREIGN KEY (id_arrondissement) REFERENCES arrondissement(id_arrondissement)
);

CREATE TABLE paiement_impots (
    id_paiement SERIAL PRIMARY KEY,
    id_maison INTEGER,
    montant NUMERIC,
    mois INTEGER,
    annee INTEGER,
    date_paiement DATE,
    FOREIGN KEY (id_maison) REFERENCES maison(id)
);

CREATE table hetra (
    id_hetra SERIAL PRIMARY KEY,
    prix NUMERIC(18,2)
);