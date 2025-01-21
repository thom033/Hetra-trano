-- Vue pour savoir dans quel arrondissement se trouve chaque maison
CREATE OR REPLACE VIEW maison_arrondissement AS
SELECT 
    m.id AS id_maison,
    a.id_arrondissement
FROM 
    maison m
JOIN 
    arrondissement_position ap ON ST_Contains(ap.position, m.position)
JOIN 
    arrondissement a ON ap.id_arrondissement = a.id_arrondissement;

-- Vue pour calculer le hetra d'une maison
CREATE OR REPLACE VIEW calcul_hetra_maison AS
SELECT 
    m.id AS id_maison,
    m.nom AS nom_maison,
    (m.longeur * m.largeur * m.nbr_etage) AS surface,
    tr.coefficient AS coefficient_rindrina,
    tt.coefficient AS coefficient_tafo,
    h.prix AS prix_par_m2,
    (h.prix * m.longeur * m.largeur * m.nbr_etage * tr.coefficient * tt.coefficient) AS hetra
FROM 
    maison m
JOIN 
    maison_detaills md ON m.id = md.id_maison
JOIN 
    type_rindrina tr ON md.id_type_rindrina = tr.id_type_rindrina
JOIN 
    type_tafo tt ON md.id_type_tafo = tt.id_type_tafo
JOIN 
    hetra h ON 1 = 1; -- Assuming there is only one row in hetra table, otherwise adjust the join condition