CREATE DATABASE LAB_1;
CREATE TABLE users(
  id     integer  ,
  firstname varchar(50) NOT NULL ,
  lastname varchar(50) NOT NULL
);
INSERT INTO users( id, firstname, lastname) VALUES (1, 'tol', 'kur');
SELECT *FROM users;

ALTER TABLE users ALTER COLUMN isadmin TYPE integer;
ALTER TABLE users ADD COLUMN isadmin integer;
ALTER TABLE users ALTER  isadmin TYPE bool USING isadmin::boolean;
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD CONSTRAINT primaryKey_tmp PRIMARY KEY (id);

CREATE TABLE tasks(
	id integer PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	user_id integer
);
SELECT * FROM tasks

DROP  TABLE tasks;
DROP DATABASE LAB_1;






