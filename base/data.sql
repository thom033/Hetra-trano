-- Insert test data into maison with realistic geographic coordinates
INSERT INTO maison (nom, longeur, largeur, nbr_etage, position) VALUES
('Trano Malagasy A', 8, 10, 1, 'POINT(-18.8792 47.5079)'), -- Antananarivo
('Trano Malagasy B', 12, 15, 2, 'POINT(-18.7669 46.8691)'), -- Antsirabe
('Trano Malagasy C', 10, 12, 1, 'POINT(-19.8659 47.0333)'); -- Fianarantsoa

-- Insert test data into type_tafo
INSERT INTO type_tafo (nom, coefficient) VALUES
('Tafo Tôle', 1.0),
('Tafo Ravinala', 0.8),
('Tafo Tuile', 1.2);

-- Insert test data into type_rindrina
INSERT INTO type_rindrina (nom, coefficient) VALUES
('Rindrina Brique', 1.0),
('Rindrina Bois', 0.9),
('Rindrina Béton', 1.1);

-- Insert test data into maison_detaills
INSERT INTO maison_detaills (id_maison, id_type_rindrina, id_type_tafo) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Insert test data into hetra
INSERT INTO hetra (prix) VALUES
(50); -- Prix par mètre carré