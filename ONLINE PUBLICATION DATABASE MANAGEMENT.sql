CREATE DATABASE MagazineDB;

USE MagazineDB;

CREATE TABLE Subscriber(
	subscriber_id INT PRIMARY KEY
IDENTITY(1,1), #This is to automate the generation of ID
	subscriber_name VARCHAR(100) NOT NULL,
	email VARCHAR(255) UNIQUE, 
	birth_date DATE,
	subscription_date DATE,
	subscription_type VARCHAR(40),
	category VARCHAR(40),
	active BIT
);

 CREATE TABLE Author
		(author_id INT PRIMARY KEY
IDENTITY(1,1),
		name VARCHAR (100) NOT NULL,
		bio VARCHAR(MAX),
		email VARCHAR(255) NOT NULL UNIQUE,
		first_publication_title VARCHAR(MAX),
		first_publication_date DATE,
		link VARCHAR (255) UNIQUE
);

CREATE TABLE INT_CONTRIBUTOR
		(ic_id INT PRIMARY KEY
IDENTITY(1,1),
		 name VARCHAR(100) NOT NULL,
		 role  VARCHAR(20) NOT NULL,
		 email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE EXTERNAL_CONTRIBUTOR
				(ec_id INT PRIMARY KEY
IDENTITY(1,1),
		name VARCHAR (100) NOT NULL,
		role VARCHAR (20) NOT NULL,
		email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Article
		(article_id INT PRIMARY KEY
IDENTITY(1,1),
		title VARCHAR (255) NOT NULL,
		author_id INT NOT NULL,
		ic_id INT,
		ec_id INT,
		content VARCHAR (MAX),
		category VARCHAR,
		publication_date DATE,
		web_ink VARCHAR UNIQUE,
		FOREIGN KEY (author_id)
		REFERENCES Author(author_id),
		FOREIGN KEY (ic_id) 
		REFERENCES INT_CONTRIBUTOR (ic_id),
		FOREIGN KEY  (ec_id )
		REFERENCES EXTERNAL_CONTRIBUTOR(ec_id)
);



