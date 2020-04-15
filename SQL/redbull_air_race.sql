PRAGMA foreing_keys = True;
PRAGMA encoding="UTF-8";

DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS aircraft;
DROP TABLE IF EXISTS pilot;
DROP TABLE IF EXISTS race;
DROP TABLE IF EXISTS participation;
DROP TABLE IF EXISTS duel;

CREATE TABLE team(
    name TEXT,
    country TEXT,
    CONSTRAINTEGER name_pk PRIMARY KEY(name)
);

CREATE TABLE aircraft(
    model TEXT,
    horsepower INTEGER,
    topspeed INTEGER,
    width REAL,
    height REAL,
    weight REAL, 
    CONSTRAINTEGER model_pk PRIMARY KEY(model)
);

CREATE TABLE pilot(
    num INTEGER,
    firstname TEXT,
    surname TEXT,
    nationality TEXT,
    birthday NUMERIC,
    teamname TEXT,
    modelaircraft TEXT,
    CONSTRAINTEGER team_fk FOREIGN KEY(teamname) REFERENCES team(name),
    CONSTRAINTEGER model_fk FOREIGN KEY(modelaircraft) REFERENCES aircraft(model)

);

CREATE TABLE race(
    location TEXT,
    edition INTEGER,
    country TEXT,
    date NUMERIC UNIQUE,
    gates INTEGER,
    eliminations INTEGER,
    CONSTRAINTEGER location_edition_pk PRIMARY KEY(location, edition)
);

CREATE TABLE participation(
    numpilot INTEGER,
    locationrace TEXT,
    editionrace INTEGER,
    trainingtime REAL CHECK(trainingtime >= 0.0),
    trainingpos INTEGER CHECK(trainingpos >= 1),
    trainingpenalty REAL,
    qualificationtime REAL CHECK(qualificationtime >= 0.0),
    qualificationpos INTEGER CHECK(qualificationpos >= 1),
    eliminationtime REAL CHECK(eliminationtime >= 0.0),
    eliminationpos INTEGER CHECK(eliminationpos >= 1),
    eliminationpenalty REAL,
    CONSTRAINTEGER numpilot_location_edition_pk PRIMARY KEY(numpilot, locationrace, editionrace),
    CONSTRAINTEGER numpilot_fk FOREIGN KEY(numpilot) REFERENCES pilot(num),
    CONSTRAINTEGER location_edition_fk FOREIGN KEY(locationrace, editionrace) REFERENCES race(location, edition)
);

CREATE TABLE duel(
    numpilot1 INTEGER,
    numpilot2 INTEGER,
    locationrace INTEGER,
    editionrace INTEGER,
    dueltytype TEXT,
    timepilot1 REAL,
    timepilot2 REAL,
    penaltypilot1 REAL,
    penaltypilot2 REAL,
    CONSTRAINTEGER duel_pk PRIMARY KEY(numpilot1, numpilot2, locationrace, editionrace),
    CONSTRAINTEGER duel_fk FOREIGN KEY(locationrace, editionrace) REFERENCES race(location, edition)
);