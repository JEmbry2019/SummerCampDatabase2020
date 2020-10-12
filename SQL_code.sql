/* SAMPLE SQL CODE */


/* Create Tables */
/* Camper NAme and Contact info */
CREATE TABLE Camper(
CamperId int PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR(100) NOT NULL,
Grade VARCHAR (20) NOT NULL,
CellPhoneNumber VARCHAR(25) ,
StreetAddress VARCHAR(50),
City VARCHAR(50),
[State] VARCHAR(25),
ZipCode VARCHAR(10),
)

/* Camper Guardian / Parent Contact info */
CREATE TABLE Guardian(
GuardianId int PRIMARY KEY,
CamperId int FOREIGN KEY REFERENCES Camper(CamperId),
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
)



CREATE TABLE Games(
GameId int PRIMARY KEY,
Title varchar(200)
)


CREATE TABLE CamperGames (
	CamperID int FOREIGN KEY REFERENCES Campers(CamoerId),
	GamesId int FOREIGN KEY REFERENCES Games(GamesId)
	CONSTRAINT CamperToGames_pk PRIMARY KEY (CamperId, GamesId),

)



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