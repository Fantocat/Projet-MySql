CREATE DATABASE Projetbdd;

USE Projetbdd;

CREATE TABLE IF NOT EXISTS Tournoi
(
    idTournoi  INTEGER,
    nomTournoi VARCHAR(30),
    ville      VARCHAR(30),
    categorie  INTEGER,
    recompense INTEGER,
    CONSTRAINT PK_tournoi PRIMARY KEY (idTournoi)
);

CREATE TABLE IF NOT EXISTS Spectateur
(
    idSpectateur INTEGER,
    nom          VARCHAR(30),
    prenom       VARCHAR(30),
    CONSTRAINT PK_SPECTATEUR PRIMARY KEY (idSpectateur)
);

CREATE TABLE IF NOT EXISTS Staff
(
    idStaff INTEGER,
    roles   VARCHAR(30),
    nom     VARCHAR(30),
    prenom  VARCHAR(30),
    age     INTEGER,
    CONSTRAINT PK_STAFF PRIMARY KEY (idStaff)
);

CREATE TABLE IF NOT EXISTS Arbitre
(
    idArbitre INTEGER,
    nom       VARCHAR(30),
    prenom    VARCHAR(30),
    age       INTEGER,
    CONSTRAINT PK_ARBITRE PRIMARY KEY (idArbitre)
);

CREATE TABLE IF NOT EXISTS Joueur
(
    idjoueur   INTEGER,
    nom        VARCHAR(30),
    prenom     VARCHAR(30),
    age        INTEGER,
    classement INTEGER,
    genre      VARCHAR(30),
    CONSTRAINT PK_JOUEUR PRIMARY KEY (idjoueur)
);

CREATE TABLE IF NOT EXISTS Terrain
(
    idTerrain INTEGER,
    nom       VARCHAR(30),
    nbplaces  INTEGER,
    CONSTRAINT PK_TERRAIN PRIMARY KEY (idTerrain)
);

CREATE TABLE IF NOT EXISTS Billet
(
    idBillet     INTEGER,
    jour         DATE,
    idTerrain    INTEGER,
    idSpectateur INTEGER,
    placeNb      INTEGER,
    categorie    VARCHAR(30),
    CONSTRAINT PK_BILLET PRIMARY KEY (idBillet),
    CONSTRAINT FK_BILLET_TERRAIN FOREIGN KEY (idTerrain) REFERENCES Terrain (idTerrain),
    CONSTRAINT FK_BILLET_SPECTATEUR FOREIGN KEY (idSpectateur) REFERENCES Spectateur (idSpectateur)
);

CREATE TABLE IF NOT EXISTS Game
(
    idGame    INTEGER,
    idjoueur1 INTEGER,
    idjoueur2 INTEGER,
    idArbitre INTEGER,
    winner    INTEGER,
    CONSTRAINT PK_MATCH PRIMARY KEY (idGame),
    CONSTRAINT PK_MATCH_F_JOUEUR FOREIGN KEY (idjoueur1) REFERENCES Joueur (idjoueur),
    CONSTRAINT PK_MATCH_S_JOUEUR FOREIGN KEY (idjoueur2) REFERENCES Joueur (idjoueur),
    CONSTRAINT PK_MATCH_WINNER FOREIGN KEY (winner) REFERENCES Joueur (idjoueur),
    CONSTRAINT PK_MATCH_ARBITRE FOREIGN KEY (idArbitre) REFERENCES Arbitre (idArbitre)
);

CREATE TABLE IF NOT EXISTS Programmation
(
    idProg    INTEGER,
    idTournoi INTEGER,
    jour      DATE,
    heure     time,
    idGame    INTEGER,
    idTerrain INTEGER,
    CONSTRAINT PK_PROG PRIMARY KEY (idProg),
    CONSTRAINT FK_PROG_MATCH FOREIGN KEY (idGame) REFERENCES Game (idGame),
    CONSTRAINT FK_PROG_TERRAIN FOREIGN KEY (idTerrain) REFERENCES Terrain (idTerrain),
    CONSTRAINT FK_PROG_TOURNOI FOREIGN KEY (idTournoi) REFERENCES Tournoi (idTournoi)
);

CREATE TABLE IF NOT EXISTS SousContrat
(
    dateDebut DATE,
    dateFin   DATE,
    idJoueur  INTEGER,
    idStaff   INTEGER,
    CONSTRAINT PK_SC PRIMARY KEY (idJoueur, idStaff),
    CONSTRAINT FK_SC_Staff FOREIGN KEY (idStaff) REFERENCES Staff (idStaff),
    CONSTRAINT FK_SC_Joueur FOREIGN KEY (idJoueur) REFERENCES Joueur (idJoueur)
);

INSERT INTO tournoi
VALUES (1, 'ROLAND GARROS', 'PARIS', 2000, 150000),
       (2, 'OPEN SUD DE FRANCE', 'MONTPELLIER', 250, 55000),
       (3, 'LUBERON TOURNOI', 'APT', 100, 10000),
       (4, 'OPEN DU VAUCLUSE', 'AVIGNON', 75, 6000),
       (5, 'OPEN 13 PROVENCE', 'MARSEILLE', 250, 73000),
       (6, 'INTERNATIONAUX D ITALIE', 'ROME', 1000, 100000),
       (7, 'MASTERS MADRID', 'MADRID', 1000, 102000),
       (8, 'OPEN BRESIL', 'RIO DE JANEIRO', 500, 66000),
       (9, 'WIMBLEDON', 'LONDRES', 2000, 175000),
       (10, 'PARIS BERCY', 'PARIS', 1000, 80000),
       (11, 'SUD CENTRE', 'MONTPELLIER', 175, 35000),
       (12, 'OPEN DU SUD OUEST', 'PERPIGNAN', 50, 4600);

INSERT INTO spectateur
VALUES (1, 'DUJARDIN', 'JEAN'),
       (2, 'SANSON', 'VERONIQUE'),
       (3, 'TARTARI', 'MICHEL'),
       (4, 'FOURNIER', 'JACQUES'),
       (5, 'NICKY', 'MINAGE'),
       (6, 'SWIFT', 'TAYLOR'),
       (7, 'Kotick', 'BOBBY'),
       (8, 'SPENCER', 'PHIL'),
       (9, 'DEARMAS', 'ANA'),
       (10, 'MACRON', 'EMMANUEL');

INSERT INTO staff
VALUES (1, 'COACH', 'SPERANZA', 'PADOVANO', 30),
       (2, 'COACH_ADJOINT', 'COUPART', 'ROMAIN', 27),
       (3, 'KINE', 'BLANC', 'THIBAULT', 49),
       (4, 'COACH_MENTAL', 'GUO', 'TIEN', 33),
       (5, 'OSTEO', 'SOUTTER', 'MADELINE', 32),
       (6, 'COACH', 'ZAKHAROVA', 'JEANNE', 28),
       (7, 'COACH_ADJOINT', 'SAWICKI', 'IRENEUSZ', 37),
       (8, 'KINE', 'DAHL', 'JONNY', 22),
       (9, 'COACH_MENTAL', 'MIYAKAWA', 'NICHIKA', 33),
       (10, 'OSTEO', 'MORENO', 'LINDOR', 30);

INSERT INTO arbitre
VALUES (1, 'MARIE', 'ELISE', 30),
       (2, 'LUCAS', 'HENRIS', 40),
       (3, 'GIRARD', 'GAEL', 41),
       (4, 'DEPARROIS', 'VICTORIA', 42),
       (5, 'MERCIER', 'GABRIEL', 43),
       (6, 'DUMONT', 'ALEXANDRE', 44),
       (7, 'GIRARD', 'ALICE', 45),
       (8, 'GUILLOT', 'BENJAMIN', 46),
       (9, 'MERCIER', 'AMAURY', 47),
       (10, 'BOE', 'JULIEN', 48);

INSERT INTO joueur
VALUES (1, 'ROYER', 'SALOME', 20, 1, 'FEMININ'),
       (4, 'PIGACHE', 'RACHEL', 23, 3, 'FEMININ'),
       (9, 'DUPUIS', 'PAULINE', 28, 2, 'FEMININ'),
       (10, 'LAMBERT', 'AUGUSTINE', 29, 4, 'FEMININ'),
       (2, 'RENAUD', 'HUGO', 21, 2, 'MASCULIN'),
       (3, 'CHABOT', 'MARTIN', 22, 4, 'MASCULIN'),
       (5, 'ROCHE', 'BAPTISTE', 24, 5, 'MASCULIN'),
       (6, 'CARPENTIER', 'NOE', 25, 6, 'MASCULIN'),
       (7, 'GUILLOT', 'ALBANE', 26, 7, 'MASCULIN'),
       (8, 'GARNIER', 'HENRI', 27, 8, 'MASCULIN'),
       (11, 'DEJEAN', 'ROBIN', 20, 1, 'MASCULIN'),
       (12, 'WINSTONE', 'THOMAS', 20, 3, 'MASCULIN');

INSERT INTO terrain
VALUES (1, 'MARNE', 500),
       (11, 'PARIS_CENTRE', 2000),
       (12, 'ESSONE', 400),
       (2, 'MONTPELLIER_SUD', 500),
       (13, 'MONTPELLIER_CENTRE', 400),
       (3, 'VITON', 100),
       (4, 'LEPONTET', 300),
       (5, 'ST_CHARLES', 500),
       (14, 'PLAN_DE_CAMPAGNE', 400),
       (16, 'ROME_CENTRE', 1000),
       (6, 'FORO_ITALICO', 800),
       (7, 'PISTA_CENTRAL', 3000),
       (15, 'ESTADIO2', 2500),
       (8, 'RIO_OLYMPIQUE', 2000),
       (9, 'RIO_CENTRE', 1600),
       (10, 'O2_ARENA', 3000),
       (17, 'CENTER_COURT', 1800),
       (18, 'PERPIGNAN_CENTRE', 500);

-- A partir de maintenant, on a entré les données pour seulement les 2 tournois de paris
INSERT INTO billet
VALUES (1, '2024-3-22', 1, 1, 36, 2),
       (2, '2024-4-18', 1, 2, 21, 2),
       (3, '2024-4-18', 1, 3, 10, 1),
       (4, '2024-4-18', 1, 4, 15, 1),
       (5, '2024-3-22', 11, 5, 3, 1),
       (6, '2024-3-22', 11, 6, 4, 1),
       (7, '2024-3-22', 11, 7, 3, 1),
       (9, '2024-4-18', 12, 8, 220, 3),
       (10, '2024-4-18', 12, 9, 221, 3),
       (11, '2024-4-18', 12, 10, 222, 3);


INSERT INTO game(idGame, idJoueur1, idJoueur2, idArbitre)
VALUES (1, 1, 4, 1),
       (2, 9, 10, 2),
       (3, 1, 9, 1),
       (4, 4, 10, 2),
       (5, 2, 3, 3),
       (6, 5, 6, 4),
       (7, 7, 8, 5),
       (8, 11, 12, 6),
       (9, 2, 5, 3),
       (10, 3, 6, 4),
       (11, 7, 11, 5),
       (12, 8, 12, 6);

INSERT INTO programmation
VALUES (1, 1, '2024-3-22', '9:00:00', 1, 12),
       (2, 1, '2024-3-22', '12:00:00', 2, 12),
       (4, 10, '2024-6-11', '9:00:00', 3, 11),
       (5, 10, '2024-6-11', '12:00:00', 4, 11),
       (7, 1, '2024-3-22', '9:00:00', 5, 1),
       (8, 1, '2024-3-22', '12:00:00', 6, 1),
       (9, 1, '2024-3-22', '9:00:00', 7, 11),
       (10, 1, '2024-3-22', '12:00:00', 8, 11),
       (14, 10, '2024-6-11', '9:00:00', 9, 12),
       (15, 10, '2024-3-22', '12:00:00', 10, 12),
       (16, 10, '2024-3-22', '15:00:00', 11, 12),
       (17, 10, '2024-3-22', '9:00:00', 12, 11);

INSERT INTO SousContrat
VALUES ('2023-09-01', '2024-09-01', 1, 1),
       ('2023-09-01', '2024-09-01', 1, 5),
       ('2023-09-01', '2024-09-01', 1, 9),
       ('2022-07-12', '2027-07-12', 11, 1),
       ('2022-07-12', '2027-07-12', 11, 7),
       ('2022-07-12', '2027-07-12', 11, 8),
       ('2022-12-31', '2023-12-31', 9, 1),
       ('2023-01-02', '2026-01-02', 5, 1),
       ('2023-03-01', '2052-06-09', 2, 1),
       ('2021-08-13', '2022-06-05', 8, 1),
       ('2023-02-01', '2023-08-01', 8, 9),
       ('2020-04-09', '2025-05-09', 7, 1),
       ('2023-11-02', '2024-07-12', 10, 1),
       ('2022-02-01', '2024-03-12', 10, 2),
       ('2023-09-01', '2024-03-12', 3, 1),
       ('2023-09-01', '2024-03-12', 4, 1),
       ('2023-09-01', '2024-03-12', 6, 1),
       ('2023-09-01', '2024-03-12', 12, 1);


-- requete 1 (JOIN)

SELECT J.nom, J.prenom
FROM Joueur J
         JOIN Game G ON J.idjoueur = G.idjoueur1 OR J.idjoueur = G.idjoueur2
         JOIN Programmation P ON G.idGame = P.idGame
WHERE P.idTerrain = 1;

-- requete group by

SELECT ville, COUNT(idTournoi) AS NombreTournois
FROM Tournoi
GROUP BY ville;

-- requete par division

SELECT idStaff, nom, prenom
FROM Staff
WHERE NOT EXISTS (SELECT idJoueur
                  FROM Joueur
                  WHERE NOT EXISTS (SELECT idJoueur
                                    FROM SousContrat
                                    WHERE SousContrat.idStaff = Staff.idStaff
                                      AND Joueur.idjoueur = SousContrat.idJoueur));

-- requete avec sous requete

SELECT nom, prenom, age
FROM Joueur
WHERE age > (SELECT AVG(age) FROM Joueur);

-- requete avec sous requete corrélative

SELECT nom,
       prenom,
       (SELECT COUNT(*)
        FROM Game
        WHERE Joueur.idjoueur = Game.idjoueur1
           OR Joueur.idjoueur = Game.idjoueur2) AS NombreMatchs
FROM Joueur;

-- verification a l'insertion d'un billet (fonction + trigger)

CREATE FUNCTION VerifierCapaciteTerrain(id_terrain INT, nb_places INT) RETURNS BOOLEAN
    DETERMINISTIC
BEGIN
    DECLARE capacite_terrain INT;

    SELECT nbplaces INTO capacite_terrain FROM Terrain WHERE idTerrain = id_terrain;

    IF nb_places > capacite_terrain THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;

CREATE TRIGGER VerifierCapaciteTerrainTrigger
    BEFORE INSERT
    ON Billet
    FOR EACH ROW
BEGIN
    DECLARE capacite_verifiee BOOLEAN;

    SET capacite_verifiee = VerifierCapaciteTerrain(NEW.idTerrain, NEW.placeNb);

    IF NOT capacite_verifiee THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Le nombre de places excède la capacité du terrain';
    END IF;
END;

-- ajouts du vainqueur du match au match suivant (trigger)

CREATE TRIGGER PreventTournamentDeletion
    BEFORE DELETE
    ON Tournoi
    FOR EACH ROW
BEGIN
    DECLARE tournamentExists INT;

    SELECT COUNT(*)
    INTO tournamentExists
    FROM Programmation
    WHERE idTournoi = OLD.idTournoi;

    IF tournamentExists > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ce tournoi ne peut pas être supprimé car des matchs sont programmés pour ce tournoi.';
    END IF;
END;

-- recuperer les joueur avec un constrat actif (procedure)

CREATE PROCEDURE GetPlayersWithActiveContracts(
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT DISTINCT J.idjoueur, J.nom, J.prenom
    FROM Joueur J
             INNER JOIN SousContrat SC ON J.idJoueur = SC.idJoueur
    WHERE SC.dateDebut <= endDate
      AND SC.dateFin >= startDate;
END;