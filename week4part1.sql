#week4
##
CREATE TABLE Star (
  kepler_id INTEGER PRIMARY KEY,
  t_eff INTEGER,
  radius FLOAT
);

COPY Star (kepler_id, t_eff, radius) FROM 'stars.csv' CSV;


#task1
INSERT INTO Star (kepler_id, t_eff, radius) VALUES
    (7115384, 3789, 27.384),
    (8106973, 5810, 0.811),
    (9391817, 6200, 0.958);
    
##
CREATE TABLE Planet (
  kepler_id INTEGER NOT NULL,
  koi_name VARCHAR(20) NOT NULL,
  kepler_name VARCHAR(20),
  status VARCHAR(20) NOT NULL,
  period FLOAT,
  radius FLOAT,
  t_eq INTEGER
);


COPY Planet (kepler_id, koi_name, kepler_name, status, period, radius, t_eq) FROM 'planets.csv' CSV;

#task2
UPDATE Planet
 SET kepler_name= NULL
 WHERE UPPER(status) !='CONFIRMED';
 
DELETE FROM Planet
 WHERE radius<0;
 

#task3
CREATE TABLE Planet (
  kepler_id INTEGER NOT NULL,
  koi_name VARCHAR(15) NOT NULL UNIQUE,
  kepler_name VARCHAR(15),
  status VARCHAR(20) NOT NULL,
  radius FLOAT NOT NULL
);
INSERT INTO Planet VALUES

  (6862328, 'K00865.01', NULL, 'CANDIDATE', 119.021),
  (10187017, 'K00082.05', 'Kepler-102 b', 'CONFIRMED', 5.286),
  (10187017, 'K00082.04', 'Kepler-102 c', 'CONFIRMED', 7.071);
  
#task4
CREATE TABLE Star (
  kepler_id INTEGER PRIMARY KEY,
  t_eff INTEGER NOT NULL,
  radius FLOAT NOT NULL
);

CREATE TABLE Planet (
  kepler_id INTEGER REFERENCES Star(Kepler_ID),
  koi_name VARCHAR(20) PRIMARY KEY,
  kepler_name VARCHAR(20),
  status VARCHAR(20) NOT NULL,
  period FLOAT,
  radius FLOAT,
  t_eq INTEGER
);

COPY Star (kepler_id, t_eff, radius) FROM 'stars.csv' CSV;
COPY Planet (kepler_id, koi_name, kepler_name, status, period, radius, t_eq) FROM 'planets.csv' CSV;


#task5
ALTER TABLE Star
  ADD COLUMN ra FLOAT,
  ADD COLUMN decl FLOAT;
  
DELETE FROM Star;

COPY Star(kepler_id, t_eff, radius, ra, decl) FROM 'stars_full.csv' CSV;