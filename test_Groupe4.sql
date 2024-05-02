
-- test de l'ajout d'un billet

-- on peut voir ici que l'on a bien un message de retour car le terrain a moins de 5000 places

INSERT INTO billet(idBillet, jour, idTerrain, placeNb, categorie)
VALUE (12, '2024-4-18', 12, 5000, 3);

-- ici tout se passe bien
INSERT INTO billet(idBillet, jour, idTerrain, placeNb, categorie)
VALUE (13, '2024-4-18', 12, 110, 3);

-- test du trigger suppresion de tournois

-- ici le tournois 1 a encore des programmation donc il ne se supprime pas

DELETE FROM tournoi
where idTournoi = 1;


-- le tournois 2 n'a pas de programmation donc il se supprime
DELETE FROM tournoi
where idTournoi = 2;

-- il n'y a plus de tournois 2

SELECT idTournoi
FROM tournoi;

-- test de la procédure


CALL GetPlayersWithActiveContracts('2022-02-01', '2022-03-12');

-- il y a bien que 3 contrats entre ces 2 date

SELECT DISTINCT J.idjoueur, J.nom, J.prenom
    FROM Joueur J
    INNER JOIN SousContrat SC ON J.idJoueur = SC.idJoueur
    WHERE SC.dateDebut <= '2022-02-01' AND SC.dateFin >= '2022-03-12';
