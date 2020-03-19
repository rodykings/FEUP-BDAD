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
    CONSTRAINT name_pk PRIMARY KEY(name)
);

CREATE TABLE aircraft(
    model TEXT,
    horsepower INT,
    topspeed INT,
    width REAL,
    height REAL,
    weight REAL, 
    CONSTRAINT model_pk PRIMARY KEY(model)
);

CREATE TABLE pilot(
    num INT,
    firstname TEXT,
    surname TEXT,
    nationality TEXT,
    birthday NUMERIC,
    teamname TEXT,
    modelaircraft TEXT,
    CONSTRAINT team_fk FOREIGN KEY(teamname) REFERENCES team(name),
    CONSTRAINT model_fk FOREIGN KEY(modelaircraft) REFERENCES aircraft(model)

);

CREATE TABLE race(
    location TEXT,
    edition INT,
    country TEXT,
    date NUMERIC UNIQUE,
    gates INT,
    eliminations INT,
    CONSTRAINT location_edition_pk PRIMARY KEY(location, edition)
);

CREATE TABLE participation(
    numpilot INT,
    locationrace TEXT,
    editionrace INT,
    trainingtime REAL CHECK(trainingtime >= 0.0),
    trainingpos INT CHECK(trainingpos >= 1),
    trainingpenalty REAL,
    qualificationtime REAL CHECK(qualificationtime >= 0.0),
    qualificationpos INT CHECK(qualificationpos >= 1),
    eliminationtime REAL CHECK(eliminationtime >= 0.0),
    eliminationpos INT CHECK(eliminationpos >= 1),
    eliminationpenalty REAL,
    CONSTRAINT numpilot_location_edition_pk PRIMARY KEY(numpilot, locationrace, editionrace),
    CONSTRAINT numpilot_fk FOREIGN KEY(numpilot) REFERENCES pilot(num),
    CONSTRAINT location_edition_fk FOREIGN KEY(locationrace, editionrace) REFERENCES race(location, edition)
);

CREATE TABLE duel(
    numpilot1 INT,
    numpilot2 INT,
    locationrace INT,
    editionrace INT,
    dueltytype TEXT,
    timepilot1 REAL,
    timepilot2 REAL,
    penaltypilot1 REAL,
    penaltypilot2 REAL,
    CONSTRAINT duel_pk PRIMARY KEY(numpilot1, numpilot2, locationrace, editionrace),
    CONSTRAINT duel_fk FOREIGN KEY(locationrace, editionrace) REFERENCES race(location, edition)
);