
CREATE TABLE Seance (
  idSeance INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  date DATE NULL,
  heure TIME NULL
);


CREATE TABLE cinema (
  idCinema INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomCinema VARCHAR(45) NOT NULL,
  adresseCinema VARCHAR(45) NOT NULL
);

CREATE TABLE Salle (
  idSalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  capacite INT NOT NULL,
  numeroSalle INT NOT NULL,
  Seance_idSeance INT NOT NULL DEFAULT 1,
  CONSTRAINT fk_Salle_Seance1 FOREIGN KEY (Seance_idSeance) REFERENCES Seance(idSeance) 
);

CREATE TABLE Film (
  idFilm INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(45) NOT NULL,
  duration VARCHAR(45) NULL,
  Seance_idSeance INT NOT NULL DEFAULT 1,
  CONSTRAINT fk_Film_Seance1 FOREIGN KEY (Seance_idSeance) REFERENCES Seance(idSeance)
);

CREATE TABLE Tarif (
  idTarif INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  type ENUM("Plein tarif", "Étudiant", "Moins de 14 ans") NOT NULL,
  montant FLOAT NOT NULL
);

CREATE TABLE reservation (
  idReservation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre_de_place INT NOT NULL,
  montant_total FLOAT NOT NULL,
  method_paiement VARCHAR(45) NOT NULL,
  Seance_idSeance INT NOT NULL DEFAULT 1,
  CONSTRAINT fk_Reservation_Seance1 FOREIGN KEY (Seance_idSeance) REFERENCES Seance(idSeance)
);

CREATE TABLE utilisateur (
  idUtilisateur INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom_utilisateur VARCHAR(45) NOT NULL,
  prenom_utilisateur VARCHAR(45) NOT NULL,
  mail_utilisateur VARCHAR(45) NULL,
  Seance_idSeance INT NOT NULL DEFAULT 1,
  FOREIGN KEY (Seance_idSeance) REFERENCES Seance(idSeance)
);

CREATE TABLE administrateur (
  idAdministrateur INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  role VARCHAR(45) NOT NULL
);


CREATE TABLE Seance_has_cinema (
  Seance_idSeance INT NOT NULL,
  cinema_idCinema INT NOT NULL,
  CONSTRAINT fk_Seance_has_cinema_Seance FOREIGN KEY (Seance_idSeance) REFERENCES Seance(idSeance),
  CONSTRAINT fk_Seance_has_cinema_cinema1 FOREIGN KEY (cinema_idCinema) REFERENCES cinema (idCinema)
    );

CREATE TABLE Seance_has_Tarif (
  Seance_idSeance INT NOT NULL,
  Tarif_idTarif INT NOT NULL,
  CONSTRAINT fk_Seance_has_Tarif_Seance1 FOREIGN KEY (Seance_idSeance) REFERENCES Seance(idSeance),
  CONSTRAINT fk_Seance_has_Tarif_Tarif1 FOREIGN KEY (Tarif_idTarif) REFERENCES Tarif(idTarif)
    );


CREATE TABLE Seance_has_Administrateur(
  Seance_idSeance INT NOT NULL,
  Administrateur_idAdministrateur INT NOT NULL,
  CONSTRAINT fk_Seance_has_Administrateur_Seance1 FOREIGN KEY (Seance_idSeance) REFERENCES Seance(idSeance),
  CONSTRAINT fk_Seance_has_Administrateur_Administrateur1 FOREIGN KEY (Administrateur_idAdministrateur) 
  REFERENCES Administrateur(idAdministrateur)
);




-- Insertion de donnees fictives dans la base de données

INSERT INTO cinema(nomCinema, adresseCinema) VALUES("cinema1", "paris");

INSERT INTO Seance(date, heure) VALUES ('2024-01-01', '14:30:00' );

INSERT INTO Salle (capacite,numeroSalle) VALUES (200 , 1);

INSERT INTO Film(titre, duration) VALUES('titanic', "3h");

INSERT INTO Tarif(type, montant) VALUES('Étudiant', 10);

INSERT INTO reservation (nombre_de_place,  montant_total, method_paiement) VALUES (3, 25, "par carte bleue");

INSERT INTO utilisateur(nom_utilisateur, prenom_utilisateur, mail_utilisateur ) VALUES('doe', "john", "johndoe@mail.com");

INSERT INTO administrateur(role) VALUES('admin général');

INSERT INTO Seance_has_cinema (Seance_idSeance, cinema_idCinema) VALUES (1 , 1);

INSERT INTO Seance_has_Tarif(Seance_idSeance, Tarif_idTarif) VALUES(1, 1);

INSERT INTO Seance_has_Administrateur(Seance_idSeance, Administrateur_idAdministrateur) VALUES(1, 1);
