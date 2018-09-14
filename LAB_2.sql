CREATE DATABASE lab2;

CREATE TABLE countries (
  country_id SERIAL,
  country_name VARCHAR(50),
  region_id INT,
  population INT,
  CONSTRAINT pKey PRIMARY KEY (country_id)
);

INSERT INTO countries VALUES (DEFAULT, 'SPAIN', 37, 017296423);

INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Kazakhstan');

INSERT INTO countries VALUES (DEFAULT, 'THAILAND', NULL, 127623);

INSERT INTO countries (country_id, country_name, region_id, population) VALUES (DEFAULT, 'FRANCE', 23, 1756055),
                                                                               (DEFAULT, 'PHILLIPINS', 178, 87123828),
                                                                               (DEFAULT, 'GVANA', 134, 100088);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES (DEFAULT, DEFAULT, 110022, 900234);

INSERT INTO countries VALUES (DEFAULT);

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING *;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 100000000; 

DELETE FROM countries AS c USING countries_new AS n WHERE c.country_id = n.country_id RETURNING *;

DELETE FROM countries;



SELECT * FROM countries;
