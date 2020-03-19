
PRAGMA foreing_keys = True;
PRAGMA encoding="UTF-8";

DROP TABLE IF EXISTS aluno;
DROP TABLE IF EXISTS prof;
DROP TABLE IF EXISTS cadeira;
DROP TABLE IF EXISTS prova;


CREATE TABLE Aluno(
    nr INT,
    nome TEXT,
    CONSTRAINT aluno_pk PRIMARY KEY(nr)
);

INSERT INTO aluno VALUES (100, 'João');
INSERT INTO aluno VALUES (110, 'Manuel');
INSERT INTO aluno VALUES (120, 'Rui');
INSERT INTO aluno VALUES (130, 'Abel');
INSERT INTO aluno VALUES (140, 'Fernando');
INSERT INTO aluno VALUES (150, 'Ismael');

CREATE TABLE prof(
    sigla TEXT, 
    nome TEXT,
    CONSTRAINT sigla_pk PRIMARY KEY(sigla)
);

INSERT INTO prof VALUES ('ECO', 'Eugénio');
INSERT INTO prof VALUES ('FNF', 'Fernando');
INSERT INTO prof VALUES ('JLS', 'Jõao');

CREATE TABLE cadeira(
    cod TEXT,
    design TEXT,
    curso TEXT,
    regente TEXT,
    CONSTRAINT regente_fk FOREIGN KEY(regente) REFERENCES Prof(sigla),
    CONSTRAINT cod_pk PRIMARY KEY(cod)

);
    

INSERT INTO cadeira VALUES ('TS1', 'Teoria dos Sistemas 1', 'IS', 'FNF');
INSERT INTO cadeira VALUES ('BD', 'Bases de Dados', 'IS', 'ECO');
INSERT INTO cadeira VALUES ('EIA', 'Estruturas de Informação e Algoritmos', 'IS', 'ECO');
INSERT INTO cadeira VALUES ('EP', 'Electrónica de Potência', 'AC', 'JLS');
INSERT INTO cadeira VALUES ('IE', 'Teoria dos Sistemas 1', 'AC', 'JLS');


CREATE TABLE prova(
    nr INT,
    cod TEXT,
    data DATE, 
    nota INT,
    CONSTRAINT nr_fk FOREIGN KEY(nr) REFERENCES aluno(nr),
    CONSTRAINT cod_fk FOREIGN KEY(cod) REFERENCES cadeira(cod),
    CONSTRAINT prova_pk PRIMARY KEY(nr, cod, data)
);

INSERT INTO prova VALUES(100, 'TS1', '92-02-11', 8);
INSERT INTO prova VALUES(150, 'TS1', '92-02-11', 20);
INSERT INTO prova VALUES(110, 'IE', '92-02-05', 10);
INSERT INTO prova VALUES(150, 'EIA', '92-01-29', 16);

