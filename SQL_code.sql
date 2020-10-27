/* SAMPLE SQL CODE 
-- Saved with SSMS under SUMER CAMP TEST OCT 26 --  */

-- CREATE DATABASE--
/*
CREATE DATABASE SummerCampOct26;
GO
USE SummerCampOct26
*/

/* Create Tables */
/* Camper Name and Contact info */
DROP TABLE IF EXISTS Campers

CREATE TABLE Campers(
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

/* Camper Guardians / Parent Contact info */

DROP TABLE IF EXISTS Guardians

CREATE TABLE Guardians(
GuardianId int PRIMARY KEY,
CamperId int FOREIGN KEY REFERENCES Campers(CamperId),
CamperName VARCHAR (100),
Allergy Bit NOT NULL,
Relationship VARCHAR (25),
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR (100) NOT NULL,
PrimaryphoneNumber VARCHAR(25) NOT NULL,
CellPhoneNumber VARCHAR(25),
StreetAddress VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
[State] VARCHAR(25) NOT NULL,
ZipCode VARCHAR(10) NOT NULL, 
EnroleDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 

)

INSERT INTO Campers(CamperId,FirstName, LastName, Grade, CellPhoneNumber, StreetAddress, City, [State], ZipCode)
VALUES
	(1, 'Bob', 'Smith', '6', '(502) 667-2222', 'Some Street', 'Lou', 'KY', '40233'),
	(2, 'Sam', 'Jones', '7', '(502) 777-2222', 'Some Other Street', 'Lou', 'KY', '40244')



INSERT INTO Guardians(GuardianId, CamperId, CamperName, Allergy, Relationship, FirstName, LastName, PrimaryphoneNumber, CellPhoneNumber, 
StreetAddress, City, [State], ZipCode) 

VALUES
	(007, 1, 'Bob',1, 'Father.', 'John', 'Smith', '(502) 222-2222', '(502) 333-3333', 'Some Street', 'Lou', 'KY', '40233'),
	(077, 1, 'Bob',1, 'Mom.', 'Jane', 'Smith', '(502) 222-2222', '(502) 303-3030', 'Some Street', 'Lou', 'KY', '40233'),
	(008, 2, 'Sam',0, 'Father.', 'Jim', 'Jones', '(502) 444-2222', '(502) 555-3333', 'Some Other Street', 'Lou', 'KY', '40244')


INSERT INTO Guardians(GuardianId, CamperId, CamperName, Allergy, Relationship, FirstName, LastName, PrimaryphoneNumber, CellPhoneNumber, 
StreetAddress, City, [State], ZipCode)
VALUES (077, 1, 'Bob',1, 'Mom', 'Jane', 'Smith', '(502) 222-2222', '(502) 303-3030', 'Some Street', 'Lou', 'KY', '40233')

Select *
FROM Campers


Select *
FROM Guardians

--Enrollment List--

SELECT Camper_Guardians.CamperID, CamperName, Guardians.GuardianId,FirstName, LastName, PrimaryphoneNumber, CellPhoneNumber 
FROM Guardians
JOIN Camper_Guardians 
ON  Guardians.GuardianId = Camper_Guardians.GuardianId


---Emergency Contact MANY to MANY ---
DROP TABLE IF EXISTS Camper_Guardians

CREATE TABLE Camper_Guardians (
	CamperID int FOREIGN KEY REFERENCES Campers(CamperId),
	GuardianId int FOREIGN KEY REFERENCES Guardians(GuardianId)
	CONSTRAINT CamperGuardians_pk PRIMARY KEY (CamperId, GuardianId),
)

INSERT INTO Camper_Guardians 
VALUES 
	(1, 007),
	(2, 008),
	(1, 077)

SELECT *
FROM Camper_Guardians

--Emergency Contact --
SELECT Camper_Guardians.CamperID, CamperName, Guardians.GuardianId,FirstName, LastName, PrimaryphoneNumber, CellPhoneNumber 
FROM Guardians
JOIN Camper_Guardians 
ON  Guardians.GuardianId = Camper_Guardians.GuardianId





DROP TABLE IF EXISTS Games

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


--Many to Many--

DROP TABLE IF EXISTS CamperGames

CREATE TABLE CamperGames (
	CamperID int FOREIGN KEY REFERENCES Campers(CamperId),
	GamesId int FOREIGN KEY REFERENCES Games(GameId)
	CONSTRAINT CamperToGames_pk PRIMARY KEY (CamperId, GamesId),

)

INSERT INTO CamperGames 
VALUES 
	(1, 1000),
	(1, 2000),
	(1, 3000),
	(2, 1000),
	(2, 2000),
	(2, 3000)
	

SELECT *
FROM CamperGames


CREATE TABLE Counselors (
	CounselorId int PRIMARY KEY,
	FirstName VARCHAR(240) NOT NULL,
	LastName VARCHAR(240) NOT NULL,
	)
/*  ----- Notes   ------   
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