DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS INGREDIENT_RECIPE; 
DROP TABLE IF EXISTS INGREDIENT; 
DROP TABLE IF EXISTS RECIPE;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS CATEGORY;

create table IF NOT exists users (
 username varchar(50) not null primary key,
 password varchar (50) not null,
 enabled boolean not null);


create table IF NOT exists authorities (
 ID INT(10) NOT NULL AUTO_INCREMENT,
 username varchar(50),
 authority varchar (50) not null,
 constraint fk_authorities_users 
 foreign key(username) references users(username),
 primary key(ID));

create table IF NOT exists INGREDIENT(
ID INT(10) NOT NULL AUTO_INCREMENT ,
NAME VARCHAR(50) NOT NULL,
UNIT_PRICE INT(10),
UP_DESCRIPTION VARCHAR(25),
DESCRIPTION TEXT,
AUTHOR varchar(50),
PRIMARY KEY(ID),
FOREIGN KEY(AUTHOR) REFERENCES USERS(USERNAME));

create table if not exists CATEGORY(
ID INT(10) NOT NULL AUTO_INCREMENT,
NAME VARCHAR(50) NOT NULL,
PRIMARY KEY(ID));

CREATE TABLE IF NOT EXISTS RECIPE(
ID INT(10) NOT NULL AUTO_INCREMENT,
NAME VARCHAR(50) NOT NULL,
DESCRIPTION TEXT,
AUTHOR_ID VARCHAR(50) NOT NULL,
CREATION TIMESTAMP,
CATEGORY_ID INT(10) NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY(AUTHOR_ID) REFERENCES USERS(USERNAME),
FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(ID));

CREATE TABLE IF NOT EXISTS INGREDIENT_RECIPE(
ID INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
INGREDIENT_ID INT(10) NOT NULL,
RECIPE_ID INT(10) NOT NULL,
AMOUNT INT(10),
FOREIGN KEY(INGREDIENT_ID) REFERENCES INGREDIENT(ID),
FOREIGN KEY(RECIPE_ID) REFERENCES RECIPE(ID));

INSERT INTO users(username, password, enabled) values ("Anonymus", "admin", false);
INSERT INTO authorities (username, authority) values ("Anonymus","ROLE_ADMIN");
INSERT INTO users(username, password, enabled) values ("botose", "1234", true);
INSERT INTO authorities (username, authority) values ("botose","ROLE_USER");
INSERT INTO users(username, password, enabled) values ("admin", "admin", true);
INSERT INTO authorities (username, authority) values ("admin","ROLE_ADMIN");

INSERT INTO CATEGORY(NAME) values ("Soup");
INSERT INTO CATEGORY(NAME) values ("Fried meat");
INSERT INTO CATEGORY(NAME) values ("Baked meat");
INSERT INTO CATEGORY(NAME) values ("Slow cooked food");
INSERT INTO CATEGORY(NAME) values ("Side dish");
INSERT INTO CATEGORY(NAME) values ("Casserole");
