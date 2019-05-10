DROP DATABASE IF EXISTS proj;

CREATE DATABASE proj;

USE proj;

CREATE TABLE leader_prof (
  leader_id			INT           	PRIMARY KEY   AUTO_INCREMENT	NOT NULL,
  first_name		VARCHAR(20)   	NOT NULL,
  last_name      	VARCHAR(20)   	NOT NULL,
  contact_num		INT		NOT NULL,
  dob				DATE			NOT NULL
  -- gender 		VARCHAR(10)
);

CREATE TABLE pol_prof (
  pol_id			INT	PRIMARY KEY	AUTO_INCREMENT		NOT NULL,
  leader_id         INT     	UNIQUE	NOT NULL,
  state      		VARCHAR(5),
  rep_or_sen        VARCHAR(5)   	NOT NULL,
  party        		VARCHAR(12)  	NOT NULL,
  CONSTRAINT poliical_fk_leader
    FOREIGN KEY (leader_id)
    REFERENCES leader_prof (leader_id)
);


CREATE TABLE committees (
committee_id        INT			PRIMARY KEY	         AUTO_INCREMENT      NOT NULL,
committee_name     VARCHAR(70)         NOT NULL,
num_members         INT                 NOT NULL,
house              TINYINT           NOT NULL
);



CREATE TABLE committee_membership (
	com_mem_id		INT			PRIMARY KEY		AUTO_INCREMENT	UNIQUE,
    pol_id			INT			NOT NULL,		
    committee_id	 	INT			NOT NULL,
    Title				VARCHAR(20),	
    CONSTRAINT commem_fk_pol
    FOREIGN KEY (pol_id)
    REFERENCES pol_prof (pol_id),
    CONSTRAINT commem_fk_comm
    FOREIGN KEY (committee_id)
    REFERENCES committees (committee_id)
);


CREATE TABLE donors  (
 donor_id             INT      PRIMARY KEY                   AUTO_INCREMENT         NOT NULL,
 donor_name      VARCHAR(70)        NOT NULL
 );

CREATE TABLE donations (
    leader_id			INT			NOT NULL,
    donor_id			INT			NOT NULL,		
    donation_id	 	    INT 	PRIMARY KEY 	NOT NULL,
	don_amount			INT	NOT NULL,
    CONSTRAINT donation_fk_leader
      FOREIGN KEY (leader_id)
      REFERENCES leader_prof (leader_id),
    CONSTRAINT donation_fk_donors
      FOREIGN KEY (donor_id)
      REFERENCES donors (donor_id)
);

CREATE TABLE cash_on_hand (
    cash_on_hand_id 	INT 	PRIMARY KEY		AUTO_INCREMENT,
    leader_id			INT			NOT NULL,
    cash_on_hand	DECIMAL(9,2),		
    CONSTRAINT networth_fk_leader
      FOREIGN KEY (leader_id)
      REFERENCES leader_prof (leader_id)
);

-- Inserts Statements for Leader’s Profile Table
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (72,'Joe','Courtney','2022252076','1953-04-06');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (8,'Robert','Menendez','2022244744','1954-01-01');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (28,'Tom','Udall','2022246621','1948-05-18');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (71,'Jim','Costa','2022253341','1952-04-13');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (78,'Susan','Davis','2022252040','1944-04-13');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (11,'Jon','Tester','2022242644','1956-08-21');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (23,'Jeff','Merkley','2022243753','1956-10-24');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (48,'Vern','Buchanan','2022255015','1951-05-08');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (38,'Gus','Bilirakis','2022255755','1963-02-08');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (5,'Robert','Casey','2022246324','1960-04-13');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (6,'Dianne','Feinstein','2022243841','1933-06-22');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (21,'James','Inhofe','2022244721','1934-11-17');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (56,'John','Carter','2022253864','1941-11-06');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (53,'Ken','Calvert','2022251986','1953-06-08');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (25,'James','Risch','2022242752','1943-05-03');


-- Inserts Statements for Political Profile Table
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (72, 72, 'CT', 'H', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (8, 8, 'NJ', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (28, 28, 'NM', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (71, 71, 'CA', 'H', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (78, 78, 'CA', 'H', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (11, 11, 'MT', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (23, 23, 'OR', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (48, 48, 'FL', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (38, 38, 'FL', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (5, 5, 'PA', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (6, 6, 'CA', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (21, 21, 'OK', 'S', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (56, 56, 'TX', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (53, 53, 'CA', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (25, 25, 'ID', 'S', 'R');

-- Inserts Statements for Net Worth Table
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (72, 750441.24);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (8, 219431.6);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (28, 447613.74);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (71, 4784717.05);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (78, 206729.07);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (11, 16363.94);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (23, 191776.67);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (48, 150257.75);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (38, 36112.27);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (5, 4289886.43);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (6, 570459.49);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (21, 626686.73);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (56, 254704.97);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (53, 517900.03);
INSERT INTO cash_on_hand ( `leader_id`, `cash_on_hand` ) VALUES (25, 43011.37);

-- Queries
-- Who are all of the members of the X committee?

-- Who are all of the chairs / ranking members of the X committee?
-- Who are all of the donors for the the X committee?
-- Who are the largest donors for all of the democrats?
-- Who are all of the donors for X politician?
-- Who are all of the donors to the R party?
-- Who are the 10 largest donors that made contributions to the X committee?

-- What amount has donor X donated to the R or D?

-- Who donated the greatest amount to R?





















DROP DATABASE IF EXISTS proj;

CREATE DATABASE proj;

USE proj;

CREATE TABLE leader_prof (
  leader_id			INT           	PRIMARY KEY   AUTO_INCREMENT	NOT NULL,
  first_name		VARCHAR(20)   	NOT NULL,
  last_name      	VARCHAR(20)   	NOT NULL,
  contact_num		INT		NOT NULL,
  dob				DATE			NOT NULL
  -- gender 		VARCHAR(10)
);

CREATE TABLE pol_prof (
  pol_id			INT	PRIMARY KEY	AUTO_INCREMENT		NOT NULL,
  leader_id         INT     	UNIQUE	NOT NULL,
  state      		VARCHAR(5),
  rep_or_sen        VARCHAR(5)   	NOT NULL,
  party        		VARCHAR(12)  	NOT NULL,
  CONSTRAINT poliical_fk_leader
    FOREIGN KEY (leader_id)
    REFERENCES leader_prof (leader_id)
);


CREATE TABLE committees (
committee_id        INT			PRIMARY KEY	         AUTO_INCREMENT      NOT NULL,
committee_name     VARCHAR(70)         NOT NULL,
num_members         INT                 NOT NULL,
house              TINYINT           NOT NULL
);



CREATE TABLE committee_membership (
	com_mem_id		INT			PRIMARY KEY		AUTO_INCREMENT	UNIQUE,
    pol_id			INT			NOT NULL,		
    committee_id	 	INT			NOT NULL,
    Title				VARCHAR(20),	
    CONSTRAINT commem_fk_pol
    FOREIGN KEY (pol_id)
    REFERENCES pol_prof (pol_id),
    CONSTRAINT commem_fk_comm
    FOREIGN KEY (committee_id)
    REFERENCES committees (committee_id)
);


CREATE TABLE donors  (
 donor_id             INT      PRIMARY KEY                   AUTO_INCREMENT         NOT NULL,
 donor_name      VARCHAR(70)        NOT NULL
 );

CREATE TABLE donations (
    leader_id			INT			NOT NULL,
    donor_id			INT			NOT NULL,		
    donation_id	 	    INT 	PRIMARY KEY 	NOT NULL,
	don_amount			INT	NOT NULL,
    CONSTRAINT donation_fk_leader
      FOREIGN KEY (leader_id)
      REFERENCES leader_prof (leader_id),
    CONSTRAINT donation_fk_donors
      FOREIGN KEY (donor_id)
      REFERENCES donors (donor_id)
);

CREATE TABLE net_worth (
    net_id 	INT 	PRIMARY KEY		AUTO_INCREMENT,
    leader_id			INT			NOT NULL,
    minimum_net	DECIMAL(9,2),		
    average_net	DECIMAL(9,2),	
    max_net		DECIMAL(9,2),		
    CONSTRAINT networth_fk_leader
      FOREIGN KEY (leader_id)
      REFERENCES leader_prof (leader_id)
);

-- Inserts Statements for Leader’s Profile Table
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (72,'Joe','Courtney','202-225-2076','1953-04-06');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (8,'Robert','Menendez','202-224-4744','1954-01-01');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (28,'Tom','Udall','202-224-6621','1948-05-18');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (71,'Jim','Costa','202-225-3341','1952-04-13');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (78,'Susan','Davis','202-225-2040','1944-04-13');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (11,'Jon','Tester','202-224-2644','1956-08-21');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (23,'Jeff','Merkley','202-224-3753','1956-10-24');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (48,'Vern','Buchanan','202-225-5015','1951-05-08');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (38,'Gus','Bilirakis','202-225-5755','1963-02-08');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (5,'Robert','Casey','202-224-6324','1960-04-13');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (6,'Dianne','Feinstein','202-224-3841','1933-06-22');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (21,'James','Inhofe','202-224-4721','1934-11-17');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (56,'John','Carter','202-225-3864','1941-11-06');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (53,'Ken','Calvert','202-225-1986','1953-06-08');
INSERT INTO leader_prof (leader_id, first_name, last_name, contact_num, dob) VALUES (25,'James','Risch','202-224-2752','1943-05-03');


-- Inserts Statements for Political Profile Table
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (72, 72, 'CT', 'H', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (8, 8, 'NJ', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (28, 28, 'NM', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (71, 71, 'CA', 'H', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (78, 78, 'CA', 'H', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (11, 11, 'MT', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (23, 23, 'OR', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (48, 48, 'FL', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (38, 38, 'FL', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (5, 5, 'PA', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (6, 6, 'CA', 'S', 'D');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (21, 21, 'OK', 'S', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (56, 56, 'TX', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (53, 53, 'CA', 'H', 'R');
INSERT INTO pol_prof (pol_id, leader_id, state, rep_or_sen, party) VALUES (25, 25, 'ID', 'S', 'R');

