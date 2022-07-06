-- SCHEMA TABELLE

CREATE TABLE dipartimento(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
direttore VARCHAR(255),
indirizzo VARCHAR (255),
PRIMARY KEY (id)
);

ALTER TABLE dipartimento ADD CONSTRAINT unique_name UNIQUE(nome);

CREATE TABLE corso_di_laurea(
id INT NOT NULL AUTO_INCREMENT,
nome_corso VARCHAR(255),
crediti INT,
id_dipartimento INT,
PRIMARY KEY (id),
FOREIGN KEY (id_dipartimento) REFERENCES dipartimento(id)
)
;

CREATE TABLE corso(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
cfu SMALLINT,
ore INT,
PRIMARY KEY(id)
)
;

ALTER TABLE corso ADD COLUMN corso_di_laurea_id INT;
ALTER TABLE corso ADD FOREIGN KEY(corso_di_laurea_id) REFERENCES corso_di_laurea(id);

CREATE TABLE insegnanti(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
cognome VARCHAR(255),
email VARCHAR(255),
PRIMARY KEY(id)
);

CREATE TABLE studente(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255),
cognome VARCHAR(255),
matricola INT,
PRIMARY KEY(id)
);

ALTER TABLE studente ADD COLUMN corso_di_laurea_id INT;
ALTER TABLE studente ADD FOREIGN KEY (corso_di_laurea_id) REFERENCES corso_di_laurea(id);

CREATE TABLE insegnanti_corso(
	insegnanti_id INT, 
	corso_id INT,
	FOREIGN KEY(insegnanti_id) REFERENCES insegnanti(id),
	FOREIGN KEY(corso_id) REFERENCES corso(id),
	PRIMARY KEY(insegnanti_id, corso_id)
);

-- INSERIMENTO DATI
INSERT INTO dipartimento (nome, direttore, indirizzo)
VALUES ('Lettere', 'Gennaro Esposito', 'via Duomo, Napoli');
INSERT INTO dipartimento (nome, direttore, indirizzo)
VALUES ('Ingegneria', 'Pierpaolo Forcina', 'via Vitruvio, Formia');

INSERT INTO corso_di_laurea 
(nome_corso, crediti, id_dipartimento)
VALUES ('Lettere classiche', 120, 1) ;
INSERT INTO corso_di_laurea 
(nome_corso, crediti, id_dipartimento)
VALUES ('Ingegneria civile', 120, 2) ;

INSERT INTO corso 
(nome, cfu, ore)
VALUES ('Letteratura italiana', 12, 60);
INSERT INTO corso 
(nome, cfu, ore)
VALUES ('Analisi II', 12, 80);

INSERT INTO insegnanti (nome, cognome, email)
VALUES ('Mario', 'Rossi', 'Rossimario@libero.it');

INSERT INTO insegnanti (nome, cognome, email)
VALUES ('Maria', 'Bianchi', 'Bianchimaria@gmail.com');

SELECT * from insegnanti;


INSERT INTO insegnanti_corso 
(insegnanti_id, corso_id)
VALUES(1, 3);

INSERT INTO insegnanti_corso 
(insegnanti_id, corso_id)
VALUES(2, 4);
