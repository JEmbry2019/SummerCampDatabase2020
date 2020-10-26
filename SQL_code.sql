/* SAMPLE SQL CODE */
-- Saved with SSMS under SUMER CAMP TEST OCT 26 --
/* Create Tables */
/* Camper Name and Contact info */
DROP TABLE IF EXISTS Campers

CREATE TABLE Campers(
CamperId int PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
/*LastName VARCHAR(100) NOT NULL,
Grade VARCHAR (20) NOT NULL,
CellPhoneNumber VARCHAR(25) ,
StreetAddress VARCHAR(50),
City VARCHAR(50),
[State] VARCHAR(25),
ZipCode VARCHAR(10),*/
)

/* Camper Guardians / Parent Contact info */
CREATE TABLE Guardians(
GuardianId int PRIMARY KEY,
CamperId int FOREIGN KEY REFERENCES Campers(CamperId),
CamperName VARCHAR (100),
Prefix VARCHAR (25),
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR (100) NOT NULL,
PrimaryphoneNumber VARCHAR(25) NOT NULL,
CellPhoneNumber VARCHAR(25) NOT NULL,
StreetAddress VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
[State] VARCHAR(25) NOT NULL,
ZipCode VARCHAR(10) NOT NULL, 

EnroleDate DATETIME NOT NULL
                DEFAULT CURRENT_TIMESTAMP, 

)

INSERT INTO Campers(CamperId,FirstName)
VALUES
	(1, 'Bob'),
	(2, 'Sam')



INSERT INTO Guardians(GuardianId, CamperId, CamperName, Prefix, FirstName, LastName, PrimaryphoneNumber, CellPhoneNumber, 
StreetAddress, City, [State], ZipCode) 

VALUES
	(007, 1, 'Bob', 'Mr.', 'John', 'Smith', '(502) 222-2222', '(502) 333-3333', 'Some Street', 'Lou', 'KY', '40233'),
	(008, 2, 'Sam', 'Mr.', 'Jim', 'Jones', '(502) 444-2222', '(502) 555-3333', 'Some Other Street', 'Lou', 'KY', '40244')
	
Select *
FROM Guardians



CREATE TABLE Games(
GameId int PRIMARY KEY,
Title varchar(200)
)

INSERT INTO Games 
VALUES 
	(1000, 'Basketball'),
	(2000, 'Football'),
	(3000, 'Computer Tech')

SELECT *
FROM Games




CREATE TABLE CamperGames (
	CamperID int FOREIGN KEY REFERENCES Campers(CamperId),
	GamesId int FOREIGN KEY REFERENCES Games(GameId)
	CONSTRAINT CamperToGames_pk PRIMARY KEY (CamperId, GamesId),

)

INSERT INTO CamperGames 
VALUES 
	(1, 1000),
	(2, 2000),
	(1, 3000)
	

SELECT *
FROM CamperGames



/*  ----- Notes   ------   

select created_at
From Guardians



DROP TABLE Campers;
DROP TABLE Guardians;

DROP TABLE Games;

DROP TABLE CamperGames;

/* INSERT VALUES 
INSERT INTO Authors(AuthorId, FirstName, LastName)
VALUES 
	(1, 'Road', 'Runner'),
	(2, 'WileE', 'Coyote'),
	(3, 'Bugs', 'Bunny')
INSERT INTO Books(BooksId, Title)
VALUES 
	(001, 'Run for the Money'),
	(002, 'Two for the Show'),
	(003, 'Three to get Ready')
INSERT INTO AuthorToBooks (AuthorId, BooksId)
VALUES 
	(1,001),
	(1, 002),
	(2, 001),
	(2, 002),
	(3, 003)


	*/



/* INSERT VALUES 

INSERT INTO Authors(AuthorId, FirstName, LastName)
VALUES 
	(1, 'Road', 'Runner'),
	(2, 'WileE', 'Coyote'),
	(3, 'Bugs', 'Bunny')

INSERT INTO Books(BooksId, Title)
VALUES 
	(001, 'Run for the Money'),
	(002, 'Two for the Show'),
	(003, 'Three to get Ready')

INSERT INTO AuthorToBooks (AuthorId, BooksId)
VALUES 
	(1,001),
	(1, 002),
	(2, 001),
	(2, 002),
	(3, 003)


/* Display AuthorToBooks Table */


SELECT AuthorId, BooksId
FROM AuthorToBooks





DROP TABLE AuthorToBooks;
SQL Code

*/