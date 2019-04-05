DROP TABLE IF EXISTS fleets CASCADE;
DROP TABLE IF EXISTS ships CASCADE;
DROP TABLE IF EXISTS sailors CASCADE;
DROP TABLE IF EXISTS duties CASCADE;

CREATE TABLE fleets (
  id  SERIAL PRIMARY KEY NOT NULL,
  fleet_name VARCHAR(50)
);

CREATE TABLE ships (
  id  SERIAL PRIMARY KEY NOT NULL,
  ship_name VARCHAR(50),
  date_built VARCHAR(50)
);

CREATE TABLE sailors (
  id  SERIAL PRIMARY KEY NOT NULL,
  sailor_name VARCHAR(50),
  date_of_birth VARCHAR(50),
  ship_name VARCHAR(50)
);


CREATE TABLE duties (  /* CHILD */
  id  SERIAL PRIMARY KEY NOT NULL,
  sailor_id INTEGER,
  start_tour VARCHAR(50),
  end_tour VARCHAR(50),
  duty_name VARCHAR(50),
  duty_rank INTEGER,
  ship_id INTEGER,
  FOREIGN KEY (sailor_id) REFERENCES sailors(id) ON DELETE CASCADE, /* It's IMPORTANT that the foreign keys come after the line they are being called in*/
  FOREIGN KEY (ship_id) REFERENCES ships(id) ON DELETE CASCADE
);

/*NOTE MUST BE IN '' NOT " "  single qoute*/
/* THE BELOW ISNT NEEDED FOR ASSIGNMENT, IT WILL BE USED TO INSERT DATA */

INSERT INTO ships (ship_name, date_built) VALUES ('Titanic', 'August, 25th, 2010');
INSERT INTO ships (ship_name, date_built) VALUES ('Killer Rubber Duck', 'January, 24th, 2012');
INSERT INTO ships (ship_name, date_built) VALUES ('Tug-a-Boat', 'February 5th, 2016');
INSERT INTO ships (ship_name, date_built) VALUES ('Big Mamma', 'April 3rd, 2014');

INSERT INTO fleets (fleet_name) VALUES ('Montreal cruise ships');
INSERT INTO fleets (fleet_name) VALUES ('British Destoryer');
INSERT INTO fleets (fleet_name) VALUES ('Billy Bobs Cruise Ships');
INSERT INTO fleets (fleet_name) VALUES ('Markham Tugger');

INSERT INTO sailors (sailor_name, date_of_birth, ship_name) VALUES ('mike', 'March 3rd, 1890', 'Titanic');
INSERT INTO sailors (sailor_name, date_of_birth, ship_name) VALUES ('Zack', 'Feb 4th, 1980', 'Ablerta Cruise');
INSERT INTO sailors (sailor_name, date_of_birth, ship_name) VALUES ('John', 'Jan 15th, 1982', 'Alberta Cruise');
INSERT INTO sailors (sailor_name, date_of_birth, ship_name) VALUES ('Billy', 'Dec 25th, 1986', 'The Montrealer');

/* TO SEE THE VALUES YOU NEED TO TYPE: "SELECT * FROM ...."*/
/* to see the structure you go type: "\d <tablename> */
INSERT INTO duties (sailor_id, start_tour, end_tour, duty_name, duty_rank) VALUES ('Jan 20th','Mar 24th', 'Commandor', 5);