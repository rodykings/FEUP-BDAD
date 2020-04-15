PRAGMA foreing_keys = True;
PRAGMA encoding="UTF-8";

DROP TABLE IF EXISTS marca;
DROP TABLE IF EXISTS modelo;
DROP TABLE IF EXISTS codpostal;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS carro;
DROP TABLE IF EXISTS reparacao;
DROP TABLE IF EXISTS peca;
DROP TABLE IF EXISTS reparacaopeca;
DROP TABLE IF EXISTS pecamodelo;
DROP TABLE IF EXISTS especialidade;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS funcionarioreparacao;

CREATE TABLE marca(
    id_marca INTEGER PRIMARY KEY AUTOINCREMENT, 
    nome TEXT
);

CREATE TABLE modelo(
    id_modelo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    marca INTEGER,
    CONSTRAINT marca_fk FOREIGN KEY(marca) REFERENCES marca(id_marca)
);


CREATE TABLE codpostal(
    codpostal1 INTEGER PRIMARY KEY,
    localidade TEXT
);

CREATE TABLE cliente(
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    morada TEXT,
    codpostal1 INTEGER,
    codpostal12 INTEGER,
    telefone INTEGER,
    CONSTRAINT codpostal1_fk FOREIGN KEY(codpostal1) REFERENCES codpostal(codpostal1)
);

CREATE TABLE carro(
    id_carro INTEGER PRIMARY KEY AUTOINCREMENT,
    matricula NUMERIC UNIQUE,
    modelo INTEGER,
    cliente INTEGER,
    CONSTRAINT modelo_fk FOREIGN KEY(modelo) REFERENCES modelo(id_modelo),
    CONSTRAINT cliente_fk FOREIGN KEY(cliente) REFERENCES cliente(cliente)
);

CREATE TABLE reparacao(
    id_reparacao INTEGER PRIMARY KEY AUTOINCREMENT,
    data_inicio NUMERIC,
    data_fim NUMERIC,
    cliente INTEGER,
    carro INTEGER,
    CONSTRAINT cliente_fk FOREIGN KEY(cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT carro_fk FOREIGN KEY(carro) REFERENCES carro(id_carro)
);

CREATE TABLE peca(
    id_peca INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo INTEGER UNIQUE,
    designacao INTEGER,
    custoUnitario REAL,
    quantidade INTEGER
);

CREATE TABLE reparacaopeca(
    reparacao INTEGER,
    peca INTEGER,
    quantidade INTEGER,
    CONSTRAINT reparacao_fk FOREIGN KEY(reparacao) REFERENCES reparacao(id_reparacao),
    CONSTRAINT peca_fk FOREIGN KEY(peca) REFERENCES peca(id_peca)
);




