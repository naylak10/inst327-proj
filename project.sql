# Create new database
DROP DATABASE IF EXISTS proj;
CREATE DATABASE proj;
USE proj;

# Create tables
CREATE TABLE Person (
  `person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE INDEX `person_id_UNIQUE` (`person_id` ASC));


# Insert People
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Beto", "O'Rourke");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Claire", "McCaskill");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Ted", "Cruz");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Bill", "Nelson");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Heidi", "Heitkamp");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Tammy", "Baldwin");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Elizabeth", "Warren");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Jacky", "Rosen");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Doug", "Jones");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Sherrod", "Brown");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Kyrsten", "Sinema");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Martha", "McSally");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Jon", "Tester");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Kirsten", "Gillibrand");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Bob", "Casey");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Tim", "Kaine");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Joe", "Donnelly");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Marsha", "Blackburn");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Debbie", "Stabenow");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Steve", "Scalise");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Devin", "Nunes");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Dean", "Heller");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Christopher S", "Murphy");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Dianne", "Feinstein");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Bernie", "Sanders");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Greg", "Gianforte");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Robert", "Menedez");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Maria", "Cantwell");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Tina", "Smith");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Conor", "Lamb");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Lucy", "McBath");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Joe", "Manchin");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Amy", "Klobuchar");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Kevin", "McCarthy");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Bryan", "Steil");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Kamala", "Harris");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Lloyd", "Smucker");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Sean", "Casten");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Josh", "Gottheimer");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Barbara", "Comstock");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Martin", "Heinrich");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Adam", "Schiff");
INSERT INTO Person (`first_name`,`last_name`) VALUES ("Roger", "Wicker");
























